# PowerShell cheat sheet for Linux administrators

Shell                      | PowerShell
---------------------------|----------------------
cat                        | cat
cd                         | cd
date                       | ```Get-Date```
df -hi                     | ```Get-PSDrive```
env                        | ```Get-ChildItem Env:```
grep                       | findstr
history                    | history
ip address show            | ipconfig
ls                         | ls or ```Get-Children```
nslookup                   | nslookup or ```Resolve-DnsName```
ping                       | ping
ps                         | ```Get-Process```
ss                         | netstat
ssh                        | ```Enter-PSSession```
systemctl start service    | ```Start-Service service```
systemctl stop service     | ```Stop-Service service```
tail -n 5                  | ```Select-Object -Last 5```
tree                       | tree
vim or gedit               | notepad

There's no equivalence for Linux ```top``` command. The following PowerShell command shows a similar output:

```While(1) {ps | sort -des cpu | select -f 15 | ft -a; sleep 2; cls}```
