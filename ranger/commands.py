from ranger.api.commands import Command

import os
import shutil
import stat
import subprocess

home = os.path.expanduser('~')
os.environ['RANGER_BOX_STATE'] = 'inactive'


def set_env_var(var: str, state: str):
    os.environ[var] = state


def get_env_var(var: str):
    return os.environ.get(var)


class new_dot_script(Command):
    """:new_dot_script <filename>

    Generate new dot script from template
    """

    def execute(self):
        f = '{}/.dots/bin/{}'.format(home, self.arg(1))
        if os.path.exists(f):
            self.fm.notify('Script already exists')
            return

        shutil.copy('{}/.dots/bin/.template'.format(home), f)
        os.chmod(f, os.stat(f).st_mode | stat.S_IEXEC)
        self.fm.edit_file(f)


class copy_path(Command):
    """:copy_path

    Copy the path of the marked file or directory
    """

    def execute(self):
        os.system('printf "{}" | xclip -sel clip'.format(self.fm.thisfile))


class zip(Command):
    """:zip <out_name>

    Zip a directory with 0 compression
    """

    def execute(self):
        zip_name = self.arg(1)
        if '.zip' not in self.arg(1):
            zip_name += '.zip'

        os.system('zip -r -0 {} {} > /dev/null 2>&1'.format(zip_name, self.fm.thisfile))



class unzip(Command):
    """:unzip

    Unzip a zip file
    """

    def execute(self):
        if '.zip' not in self.fm.thisfile.realpath:
            self.notify('Not a zip file')
            return

        os.system('unzip {} > /dev/null 2>&1'.format(self.fm.thisfile))


class box(Command):
    """:box

    """

    def execute(self):
        state = get_env_var('RANGER_BOX_STATE')
        batch_file = '/files/media/storage2/download/batch'

        if state == 'active':
            set_env_var('RANGER_BOX_STATE', 'inactive')

            with open(batch_file, 'w') as f:
                for line in self.fm.thistab.get_selection():
                    fix_path = ''.join(line.realpath.split('/')[4:]).replace(' ', '\ ')
                    f.write('get -r {} /files/media/storage2/download/\n'.format(fix_path))
                 
            self.fm.edit_file(batch_file)
            os.system('sudo umount {}/mnt'.format(home))
            #subprocess.Popen(['sftp', '-b', '/files/media/storage2/download/batch', 'box:/home/normarken/downloads'])
            self.fm.cd(home)

        else:
            set_env_var('RANGER_BOX_STATE', 'active')
            os.system('sshfs r5hej@dsb33542.seedbox.io:/home/normarken/downloads $HOME/mnt/')
            self.fm.cd(home + '/mnt')
