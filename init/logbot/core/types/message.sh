# All rights reserved.

Message() {
    . <(sed "s/_Message/$1/g" init/logbot/core/types/messageClass.sh)
}
