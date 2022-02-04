-- Code to lay out toki pona glyphs in arrays by shape class.

-- Start a group  The name goes out in bold, followed by
-- the start of the table with the proper number of
-- columns.
function grouphead(name)
  tex.print(string.format("\\section*{%s}", name))
  tex.print("\\begin{tabular}{")
  for col=1, wid do
    tex.sprint(" p{1.2cm}")
    end
  tex.sprint(" }")
  end

-- Close out the table.
function endgroup()
  tex.print("\\end{tabular}")
  end

-- Process a group of similarly shaped glyphs.  The first word
-- in the string is the group name.
function group(line)
  local wn = 0		       -- Word Number
  local col = 1		       -- Column Number
  for word in (line):gmatch "%a*" do
    if(wn == 0)		    -- First word is the group name
    then
      grouphead(word)		-- Emit header and start table
      col = 1
    else
      if( col > wid )		-- Exceeded max columns
      then
        tex.sprint(" \\\\[0.5cm]")
	col = 1
      else
        if( col > 1 )		-- Additional column
	then
	  tex.sprint(" & ")
	end
      end
      tex.sprint(string.format("\\tpGlyph{%s}", word)) -- Emit one glyph cell
      col = col + 1
      end
    wn = wn + 1
    end
  if( col > 1 )		-- End of string. Partial row already out?
  then
    tex.sprint(" \\\\")
  end
  endgroup()		-- Finish the table
  end

wid = 10			-- Maximum columns

-- Output all the words
group("Circles ijo jan lawa kili ma mama mani wawa meli\
mije tonsi moli nasa sike suno tenpo toki kokosila lape nimi\
palisa misikeke lukin")
group("D alasa kalama uta")
group("Six mi ona sina")
group("Squares lipu len sona sitelen pu pakala\
monsi sinpin anpa insa poka open poki leko")
group("Straight a o kin lon nasin epiku ni pini taso nanpa wan\
sama tu mute meso sin namako seli supa selo sijelo")
group("Angles ala ante weka anu e li suli lili utala\
monsuta pan en lete ken pi kipisi")
group("Triangles kule laso loje walo jelo pimeja")
group("Curves ale ike pona la kon telo jasima kute linja\
musi nena lupa seme tan wile")
group("Hand luka kepeken pana pali moku")
group("Feet noka awen tawa kama")
group("Animals akesi kala pipi waso soweli suwi mu")
group("Squiggles unpa lanpan jaki esun sewi jo kasi")
group("Other olin pilin mun ko kiwen tomo ilo kulupu oko soko")
