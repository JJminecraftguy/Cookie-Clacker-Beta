rm -r img
rm -r loc
rm -r snd
mkdir img
mkdir loc
mkdir snd
for f in $(cat _jslist.txt) ; do 
  rm "$f"
done
cd img/
wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/img/
grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _imglist.txt
wget -N -i _imglist.txt -B http://orteil.dashnet.org/cookieclicker/beta/img/
cd ../snd/
wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/snd/
grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _sndlist.txt
wget -N -i _sndlist.txt -B http://orteil.dashnet.org/cookieclicker/beta/snd/
cd ../loc/
wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/loc/
grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _loclist.txt
wget -N -i _loclist.txt -B http://orteil.dashnet.org/cookieclicker/beta/loc/
cd ../
wget -O index.html http://orteil.dashnet.org/cookieclicker/beta/
wget -O style.css http://orteil.dashnet.org/cookieclicker/beta/style.css
wget -N -i _jslist.txt -B http://orteil.dashnet.org/cookieclicker/beta/
wget -O grab.txt http://orteil.dashnet.org/patreon/grab.php
