echo
total_cpu=$(vmstat | awk 'NR==3 {print 100 - $15}')
echo "Total CPU Usage: $total_cpu%"

echo 
used_mem=$(free | awk 'NR==2 {printf "%.1f", $3/$2 * 100}')
free_mem=$(free | awk 'NR==2 {printf "%.1f", $4/$2 * 100}')
echo "Used Memory: $used_mem%"
echo "Free Memory: $free_mem%"

echo
used_desk=$(df -h / | awk 'NR==2 {print $3}')
free_desk=$(df -h / | awk 'NR==2 {print $4}')
echo "Used Disk Space: $used_desk"
echo "Free Disk Space: $free_desk"

echo 
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

