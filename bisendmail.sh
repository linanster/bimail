#! /usr/bin/env sh
#
workdir=$(cd "$(dirname $0)" && pwd)
cd "$workdir"

date=$(date +%F)
subject="BI Dashboard Database Daily Report ${date}"
from='nan2.li@ge.com'
# tomail='nan2.li@ge.com,'
# tomail='nan2.li@ge.com,believelinan@aliyun.com'
# tomail='zhe.hu@ge.com,'
# tomail='Zhiyong.Wang@ge.com,zhe.hu@ge.com,blake.xue@ge.com,nan2.li@ge.com'
tomail='Zhiyong.Wang@ge.com,zhe.hu@ge.com,blake.xue@ge.com,nan2.li@ge.com,logan.wanner@ge.com,tom.stimac@ge.com'
ccmail='nan2.li@ge.com,blake.xue@ge.com'
attach1='data/overview.txt'
attach2="data/device.txt"
attach3="data/device_type_format.txt"
attach4="data/cbyge_devices_commissioned.txt"
body="data/body.txt"

# echo **Query Time: $(date -d "+8 hours" "+%F %T")** > "${body}"
echo **Query Time: $(date -d "+8 hours" "+%F %T") \(China Standard Time\) $(date -d "-8 hours" "+%F %T") \(Pacific Standard Time\)** > "${body}"
echo >> "${body}"
echo '**Data source: mysql -hestar.xlink.cloud -uroot -pGEMysql20200 GE**' >> "${body}"
echo >> "${body}"
echo '**This is automatic mail from SES (Amazon Simple Email Service) !**' >> "${body}"
# echo >> "${body}"
echo >> "${body}"
echo "Quick Overview (for pretty output, please refer to attached overview.txt):" >> "${body}"
echo >> "${body}"
cat "${attach1}" >> "${body}"


# mail -s "${subject}" nan2.li@ge.com < "${body}"
# mail -s "${subject}" -r ${from} nan2.li@ge.com < "${body}"
# mail -s "${subject}" -r "${from}" -c "${ccmail}" "${tomail}" < "${body}"
mail -s "${subject}" -r "${from}" -A "${attach1}" -A "${attach2}" -A "${attach3}" -A "${attach4}" "${tomail}" < "${body}"
if [ $? -eq 0 ]; then
  echo "==mail sent success=="
else
  echo "==mail sent error=="
fi
