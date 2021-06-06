# pylint: disable=missing-module-docstring
#
# Copyright (C) 2020 by https://github.com/amanpandey7647/ExtremisUserbot@Github, < https://github.com/amanpandey7647/ExtremisUserbot >.
#
# This file is part of < https://github.com/amanpandey7647/ExtremisUserbot > project,
# and is released under the "GNU v3.0 License Agreement".
# Please see < https://github.com/amanpandey7647/ExtremisUserbot >
#
# All rights reserved.

import os

from extremis import extremis


async def _worker() -> None:
    chat_id = int(os.environ.get("CHAT_ID") or 0)
    type_ = 'unofficial' if os.path.exists("../extremis/plugins/unofficial") else 'main'
    await userge.send_message(chat_id, f'`{type_} build completed !`')

if __name__ == "__main__":
    extrmis.begin(_worker())
    print('Extremis test has been finished!')
