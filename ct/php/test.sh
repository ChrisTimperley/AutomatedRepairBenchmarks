#!/bin/bash
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
test_id=$1
num_pos=$(wc -l passes.txt | cut -d' ' -f1)
num_neg=$(wc -l fails.txt | cut -d' ' -f1)
num_all=$((${num_pos} + ${num_neg}))

case ${test_id} in
  p*)
    offset=$(echo "${test_id}" | cut -d'p' -f2)
    test_name=$(tail -n+${offset} passes.txt | head -n1);;
  n*)
    offset=$(echo "${test_id}" | cut -d'n' -f2)
    test_name=$(tail -n+${offset} fails.txt | head -n1);;
esac

pushd "${here_dir}/source" > /dev/null
timeout ${TEST_TIMEOUT} php run-tests.php -q -p sapi/cli/php "${test_name}" \
  |& grep -q "FAIL "
failed=$?
if [ $failed -eq 0 ]; then
  echo "FAILED (${test_id}): ${test_name}"
  exit 1
else
  echo "PASSED (${test_id}): ${test_name}"
  exit 0
fi