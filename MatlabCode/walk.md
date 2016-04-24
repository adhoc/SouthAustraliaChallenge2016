# Using walk.pl

Using the Octave code written by Damian export.m, check out the Marvel Challenge Data;

mkdir ~/src/
git clone https://github.com/SpaceAppsAdl/MarvelChallenge2016DataFiles.git
git clone https://github.com/adhoc/SouthAustraliaChallenge2016.git
cd ~/src/SpaceApps/SouthAustraliaChallenge2016/MatlabCode



Run the following code snippet in octave;
  octave
  cellfun(@(x) @export(x, "out/"), glob("$REPOPATH/SpaceApps/MarvelChallenge2016DataFiles/C*"))
  quit

Then run the perl script to display the five hundred columns by seventy five rows of data.
You might want to set your terminal font to say 3 or 4 ;)

  perl ./walk.pl


