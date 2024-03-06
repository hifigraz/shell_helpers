#!/usr/bin/env sh

test_dir=$(dirname "$0")
. "${test_dir}"/../log.sh

date_expression='[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]:[0-9][0-9][0-9][0-9][0-9][0-9]'
zero_date=00000000:000000

for i in "$(dirname "$0")"/log_test[0-9][0-9].cmd; do
  printf "Running %s " "$(basename "${i}")"
  debug_command="$(cat "${i}")"
  eval "${debug_command}" 2>&1 |sed -e "s/${date_expression}/${zero_date}/" > "${test_dir}"/out.txt
  diff "${test_dir}"/out.txt "$(echo "${i}" 2>&1| sed s/.cmd/.out/)" && printf "OK\n"  || printf "\n%s FAIL\n" "$(basename "${i}")"
  [ -e "${test_dir}"/out.txt ] && rm "${test_dir}"/out.txt
done
