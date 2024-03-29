#!/bin/sh
#
#
#  2016 (c) IxorTalk CVBA
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains
# the property of IxorTalk CVBA
#
# The intellectual and technical concepts contained
# herein are proprietary to IxorTalk CVBA
# and may be covered by U.S. and Foreign Patents,
# patents in process, and are protected by trade secret or copyright law.
#
# Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained
# from IxorTalk CVBA.
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.
#


# Exit on non-zero return values
set -e

IXORTALK_PROFILE=${IXORTALK_PROFILE:="dev"}
IXORTALK_CONFIG_SERVER_LABEL=${IXORTALK_CONFIG_SERVER_LABEL:="master"}
IXORTALK_CONFIG_SERVER_URL=${IXORTALK_CONFIG_SERVER_URL:="http://ixortalk-config-server:8899/config"}
IXORTALK_CONFIG_SERVER_PATH=${IXORTALK_CONFIG_SERVER_URL}/ixortalk.prometheus.faker/${IXORTALK_PROFILE}/${IXORTALK_CONFIG_SERVER_LABEL}

export CONFIG_URI=${CONFIG_URI:="$IXORTALK_CONFIG_SERVER_PATH/config.json"}

echo "Starting echo ${HOSTNAME} with config_uri $CONFIG_URI"

npm install jq.node -g

./create_faker_asset.sh ${HOSTNAME} 9191


npm start
