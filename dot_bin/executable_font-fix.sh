#!/bin/sh
set -e
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo "Setting up Noto Emoji font..."
# 1 - install  noto-fonts-emoji package
pacman -S noto-fonts-emoji --needed
# pacman -S powerline-fonts --needed
echo "Recommended system font: inconsolata regular (ttf-inconsolata or powerline-fonts)"
# 2 - add font config to /etc/fonts/conf.d/01-notosans.conf
echo "<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Sans</family>
   </prefer> 
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Serif</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Noto Mono</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
    <family>DejaVu Sans Mono</family>
   </prefer>
 </alias>
</fontconfig>

" > /etc/fonts/local.conf
# 3 - update font cache via fc-cache
fc-cache
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."
echo "consider inconsolata regular"

The first part is to install the package noto-fonts-emoji. The parameter --needed is used to only download and install the package, if it's not already installed.
The second part is just creating a config file and saving it.
The third part with fc-cache is the refresh of the font cache.

I recommend Inconsolata Nerd Font Mono Regular or any other font without emojis as system font. If you see numbers as emojis in your Browser, it is likely that your current system font contains emojis itself (DejaVu is one example) and you need to switch to a different font so you get the colored emojis.

Update 20.02.2020
There is a much easier way and I edited this post to contain the new information. Before there was a bit trial and error to find out the number for the font config file. With the new way, it's just one file.

Discussion (12)
Subscribe
pic
Add to the discussion
 
thepbone profile image
Tim Schneeberger
•
Jul 20 '20 • Edited on Jul 20

Great post!
But I noticed that <?xml version="1.0"?> evaluates to <?xml version=1.0?> (in zsh) which causes a syntax error when running fc-cache.
The same thing happens for <!DOCTYPE fontconfig SYSTEM "fonts.dtd">. Escaping the double quotes fixes this.


5
 likes
Reply
 
darksmile92 profile image
Robin Kretzschmar
•
Jul 21 '20

Thanks Tim, good point! Maybe I should mention that in the post :)


1
 like
Reply
 
marchingon12 profile image
Austin Hornhead
•
Oct 8 '20

I believe changing double quotes to single quotes would avoid the error from coming up. Other than that, the script is great! I've been trying to do smth like this for some time now, so thank you for writing this!


1
 like
Reply
 
patarapolw profile image
Pacharapol Withayasakpunt
•
May 2 • Edited on May 2

It works better then ArchWiki itself.

However, it destroyed my Conkies. I have to tweak them a bit.

Lastly, > /etc/fonts/local.conf is dangerous. You should either use a text editor or backup first.

I would also consider using fc-cache -v, instead of fc-cache.

Almost perfect

Actually, only ALMOST perfect.


1
 like
Reply
 
abracwan profile image
Chris Abraham
•
Aug 21 '20

Do you know how I could get this script working with Twitter Emoji Color (aka twemoji)?

I replaced all lines with <family>Noto Color Emoji</family> with <family>Twitter Color Emoji</family>, but it didn't work.


1
 like
Reply
 
thediamondcg profile image
Diamond
•
Sep 19 '20

Go into whatever your font management application is for your DE, and then search for the font's name. Whatever name shows up in the font manager is the name that you have to use in the section. It's how I found out to use JoyPixels for my emojis.


3
 likes
Reply
 
otaviocapila profile image
Otávio Capila
•
Jul 7 '20 • Edited on Jul 7

How do i revert this? My fonts seems weird now,with a lot of space between each word :/


1
 like
Reply
 
darksmile92 profile image
Robin Kretzschmar
•
Jul 7 '20 • Edited on Jul 7

The easiest way would be if you have a backup of your /etc/fonts/local.conf file or didn't had this file at all before!
In that case, either restore the backup file or delete the /etc/fonts/local.conf file completely and run fc-cache.

In case you have no backup and had customizations in that file before, open it with an editor and remove all lines containing the emoji font (in this case e.g. Noto...). Save and run fc-cache.


5
 likes
Reply
 
otaviocapila profile image
Otávio Capila
•
Jul 7 '20

Oh, thanks!


2
 likes
Thread
darksmile92 profile image
Robin Kretzschmar
•
Jul 7 '20 • Edited on Jul 7

you're welcome ☺️ Did it work?


2
 likes
Thread
otaviocapila profile image
Otávio Capila
•
Jul 7 '20

Worked perfectly!


2
 likes
Thread
darksmile92 profile image
Robin Kretzschmar
•
Jul 7 '20

Nice 👍


1
 like
Reply
Code of Conduct • Report abuse
Read next
marcbernard11 profile image
SAP C_FIORADM_21 Dumps - Best Way To Eliminate Exam Stress
marcbernard11 - May 24

shivamgohel profile image
Best HCI graduate programs in the US
Shivam Gohel - May 24

aliasalan profile image
PHP - Google/YT - An OAuth issue
Alias - May 24

tinamoo84361260 profile image
What is Qlik Sense?
Tina Moore - May 24

Robin Kretzschmar profile image
Robin Kretzschmar
Started coding at the age of 13, now a professional software engineer and Scrum Master, creating and maintaining enterprise solutions. Eat - Sleep - Code - Lift - Repeat 💪🏾
Follow
WORK
Senior Software Engineer, SCRUM Master
LOCATION
Mannheim, Germany
JOINED
Nov 14, 2017
Trending on DEV Community 
UnixByX profile image
Should I focus on learning JavaScript over the summer or learn a different language?
#javascript #discuss
Gracie Gregory (she/her) profile image
What was your win this week?
#discuss #weeklyretro
Amelia Vieira Rosado profile image
Algorithms are ruining our lives 😒
#discuss #healthydebate #watercooler #algorithms
#!/bin/sh
set -e
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo "Setting up Noto Emoji font..."
# 1 - install  noto-fonts-emoji package
pacman -S noto-fonts-emoji --needed
# pacman -S powerline-fonts --needed
echo "Recommended system font: inconsolata regular (ttf-inconsolata or powerline-fonts)"
# 2 - add font config to /etc/fonts/conf.d/01-notosans.conf
echo "<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Sans</family>
   </prefer> 
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Serif</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Noto Mono</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
    <family>DejaVu Sans Mono</family>
   </prefer>
 </alias>
</fontconfig>

" > /etc/fonts/local.conf
# 3 - update font cache via fc-cache
fc-cache
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."
echo "consider inconsolata regular"

Home Reading List Listings Podcasts Videos Tags Code of Conduct FAQ DEV Shop Sponsors About Privacy Policy Terms of use Contact Write a post
    
DEV Community – A constructive and inclusive social network for software developers. With you every step of your journey.

Built on Forem — the open source software that powers DEV and other inclusive communities.

Made with love and Ruby on Rails. DEV Community © 2016 - 2021.
