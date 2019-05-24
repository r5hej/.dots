from ranger.api.commands import Command

import os
import shutil
import stat

home = os.path.expanduser('~')

class new_dot_script(Command):
    """:new_dot_script <filename>

    Generate new dot script from template
    """

    def execute(self):
        f = '{}/.dots/bin/{}'.format(home, self.arg(1))
        if os.path.exists(f):
            self.fm.notify('Script already exists')
            return

        shutil.copy('{}/.dots/bin/.template'.format(home) , f)
        os.chmod(f, os.stat(f).st_mode | stat.S_IEXEC)
        self.fm.edit_file(f)


class copy_path(Command):
    """:copy_path

    Copy the path of the marked file or directory
    """

    def execute(self):
        os.system('printf "{}" | xclip -sel clip'.format(self.fm.thisfile))
