#!/usr/bin/python
# -*- coding: utf8 -*-
# ******************************************************************************
#
#  (C) 2019 Magna Powertrain AG & Co KG - All rights reserved!
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.
#
#  *****************************************************************************


import subprocess  # cmd execution
import re

from mks_api.etc.exceptions.MksException import MksException
from mks_api.etc.mks_api_tools import get_args
from mks_api.etc.exceptions.exception_binds import ERROR_BINDS
from mks_api.etc.server_handling import get_im_server_handler, \
    get_si_server_handler


class MksCommunication:
    """Represents an instance of an MKS SI/IM communication"""

    def __init__(self, base_command="si",
                 verbose=True):
        """
        :param hostname: hostname of the server
        :param port: port of the server
        :param base_command: si or im depending on which MKS software you
        want to use
        :param verbose:
        """
        self.decode = 'cp850'  # default encoding
        self.verbose = verbose  # change to show debug messages
        self.clientIsOpen = False
        self.base_command = base_command

        if self.base_command == 'si':
            self.server_handler = get_si_server_handler()
        else:
            self.server_handler = get_im_server_handler()

    def cmd(self, cmd, cmdOpt=""):
        """
        Executes an si command
        :param cmd: the command to be executed
        :param cmdOpt: the options in the command execution

        e.g. self.cmd("createcp", "--issueId=1234, --description=testing")
        will create a change package with issueId 1245 and the description
        testing

        :return:
        """

        # TODO  Figure the server thing out!
        # cmdDefaultOpts = "--hostname=" + self.hostname + " --port=" +
        # self.port + " --batch"

        command_default_options = get_args(
            batch=None, hostname=self.server_handler.get_hostname(),
            port=self.server_handler.get_port())
        return self.raw_cmd(cmd, command_default_options + " " + cmdOpt)

    def raw_cmd(self, cmd, cmdOpt=""):
        """
        Issues a raw MKS command and
        :param cmd:
        :param cmdOpt:
        :return:
        """

        mks_cmd = f"{self.base_command} {cmd} {cmdOpt}"

        # Open Communication line
        mks_process = subprocess.Popen(mks_cmd, stdout=subprocess.PIPE,
                                       stderr=subprocess.STDOUT)

        # wait until the call is finished and get stdout
        text, error = mks_process.communicate(timeout=3600)

        result = self.check_output_for_errors(text, error)

        return result

    def start_cmd(self, cmd, options=""):
        """
        :param cmd: Command to be executed
        :param options: Command options/parameters
        :return:
        """
        cmd_default_options = f"--hostname={self.hostname} " \
                              f"--port={self.port} --batch"
        mks_cmd = f"{self.base_command} {cmd} {cmd_default_options} {options}"

        process = subprocess.Popen(mks_cmd,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.STDOUT)

        return process

    def read_cmd(self, mks_process: subprocess):
        """
        :param mks_process: MKS Subprocess
        :return:
        """
        # wait until the call is finished and get stdout
        text, error = mks_process.communicate(timeout=3600)

        result = self.check_output_for_errors(text, error)

        return result

    def check_output_for_errors(self, output: bytes, error=None):
        """
        Checks an MKS response for errors. The error patterns and
        their respective exception types are defined in ERROR_BINDS,

        :param output: output
        :param error:
        """
        output = output.decode(self.decode)

        if not (error is None):
            raise MksException(f"MKS error occoured: {error},\n {output}")
        if output is None:
            raise MksException(f"No Returned MKS output {error},\n {output}")

        for pattern, exception in ERROR_BINDS:
            matches = re.findall(pattern, output)
            if matches:
                raise exception(f"{error} \n {output}", error)

        return output

