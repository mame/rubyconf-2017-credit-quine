def bpe(dd, nn = 91)
  d = dd
  c_ = nil
  keys = []
  nn.downto(35).each do |c|
    c_ = c
    h = Hash.new(0)
    (d.size - 1).times do |i|
      h[d[i, 2]] += 1
    end
    k = h.map {|k, v| [v, k] }.max.last
    d2 = d.gsub(k, c.chr)
    break if d.size == d2.size + 2
    keys << k
    d = d2
  end
  if c_ == 35
    return keys.reverse.join, d, (keys.join + d).size
  else
    return bpe(dd, nn - (c_ - 35))
  end
end

def decode_bpe(k, d)
  c=35;k.scan(/../){c+=1;d=d.gsub(c.chr,$&)};d
end

LOGO_K, LOGO_S, _size = bpe(<<'END'.lines.map {|l| l.chomp[1..-2] }.join.tr(" #'()+,-./=@MTV_\\\\","a-z"))
!  ,#########.                                                                               !
!,#####   #####.      ++====\  ()        ()            ++   /====\                           !
!###         ###      ||    \\               ++        ||  //    \\                          !
!###         ###      ||    || || //==|| || =||= ===\\ ||  ||    || //===\//===\ ====\ |//\\ !
!    ###     ###      ||    // || \\  || ||  ||  //=|| ||  \\    // ||    |+===/ //=|| ||  ||!
!##  ###..#####'      ++====/  ++  \==|| ++  \\= \\=|| ++   \====/  \\===/\\===/ \\=|| ||  ||!
!  ##   #####'                    ====//                                                     !
!.__         @@.             .   ,           .  !
!|   . _   __. . . _   __     \ /  __. ._ __ |TM!
!|-- |/ \ /  | | |/ \ /__\     V  /  | |'/  \|  !
!|__ |  | \__| | |  | \___     |  \__| | \__/|  !
!         `--'                                  !
END

### CODE

MARGIN = 11
margin = "#" * 99 + "\n"
TMPL = margin * MARGIN + <<END + margin * MARGIN
###################################################################################################
####################                   ############     ..##   ###..::##  .   ..###   #####:::#####
####################                   ############     ...#   ###..::##  .###...#### ..#:::#######
####################                    ############### ...#   ###..::##  .::::::######:::#########
####################                    ###########     .###   ###..::##  .::::::::####  .#########
###################:#                   ###########:::##:::##   ##..::##  .#####:::####  .#########
################::#:# ##                 ##########:::##:::####  ..#::##  .::::::######  .#########
###############:##::##  #                ##########################################################
###::####::::::###::##   ######    ##    ##########################################################
###:::::::::::::::::#################     ############    ..###### ..:::####:::#  ...##  .::::::###
####::::#########:::###:::::::::####      ##########::    ...###   ..:::::##:::  ##...#  .::::::###
####:::::#########::##:::::::::#####.   . #########::::########   ######:::#::: ###...#  .#########
#####::::::#######::##:::::::######. . . . ########::::########   ######:::#::: ###...#  .:::######
########::::::::::::############. . . . . .#########::    ...###   ..:::::##::: ###...#  .#########
#########:::::##:##:#..#..#####... ... ... ###########    ..###### ..:::####::: ###...#  .#########
####################........................#######################################################
####################........................#######################################################
####################........................#######:::#  ...######:::   ####  .#########    ..#####
####################..................#############:::  ##...###:::::   ..##  .########   ###...###
####################..........#####################::: ###...##:::######...#  .########   ###...###
####################...############################::: ###...##:::######...#  .########   :::...###
###################################################::: ###...###:::::   ..##  .########   ###...###
###################################################::: ###...#####:::   ####  .:::::::#   ###...###
###################################################################################################
END
TMPL_E=TMPL.tr("\n","!")

COLOR_K, COLOR_S, _size = bpe(TMPL.lines.map {|l| l.chomp.chars }.join.tr("#", "").tr(" .:", [93,95,96].pack("C*")))
COLOR=decode_bpe(COLOR_K, COLOR_S)

CODE = TMPL.tr("# .:", "#   ")

violin = <<END.gsub(/#.*\n/, "")
# 0
L2 v40 fe dc BA Bc v50 dc BA GF GE
# 8
L4 v60 DFAG FDFE D_BDA GBAG FDEc dfaA BGAF Dv70dd4.c8
# 16
L8 dcdDCAEF DdcBcfab gfegfedc BAGFEGFE
L8 DEFGAEAG FBAGAGFE D_BBcdcBA GFEBABAG
# 24
L4 Ffe2 v40 rdf2 b2a2 b2^c2 ^ddc2 rBd2 d2.d v60 dgea
# 32
L16 v80 a8fga8fgaABcdefg f8def8FGABAGAFGA
L16 G8BAG8FEFEDEFGAB G8BAB8cdABcdefga
L16 f8def8edecdefedc d8Bcd8DEFGFEFdcd
L16 B8dcB8AGAGFGABcd B8dcd8cBcdedcdBc
# 40
L4 v40 drcr Brdr DrDr DrEr rArA rFrA rGrF rGrv60e
# 48
L8 v70 fFGFEefe dFDBA_A_G_A _BBcBA_A_G_A _BBABcC_BC DdedcCDC _BBABcCFE DdegfFAf v50dgfgeAGA 
# 56
L8 FAAAAAAA FFFFFFAA GGGddddd ddBBAAec Afffeeee ddddaaaa bbbbaaaa bbbb^cccc
# 64
L8 v60 dD16E16FDCc16d16ec B_B16C16D_BCA16G16FE
L8 DG16F16EGFD16E16FA GB16A16GFEA16G16FE
L8 Fd16c16dFAA16B16cA Fd16e16fdff16e16dc
L8 BB16A16Bcdf16e16df gd16c16BBAEAA
# 72
L4 A2.A4 D2.A4 G2A2 G4D4D4.D8 Ddc2 B2A2 D4.E8F2 B2E4.E8
# 80
L8 F4.ffgfe d4.ddedc B2d2 dc-BcA4.A A4.aabag f4.ffgfe dc-Bc-A4.A G4d4c4.c
# 88
L8 d4d2c4 c4B2A4 A4G2F4 F4.EE2 F4f2e4 d4^d2^c-4 b2^d4a4 b2a2
# 96
L8 a2A4.G F2f4.e d2.d4 d2c2 d4D4C4c4 B4_B4_A4A4 G4g4f4F4 E4B4E4e4
# 104
L8 f4F4E4e4 d4D4C4c4 B4b4a4A4 G4.e8a4a4 A1
END

vlc = <<END.gsub(/#.*\n/, "")
v60
L2
# 0
dA BF GD GA dA BF GD GA
# 8
dA BF GD GA dA BF GD GA
# 16
dA BF GD GA dA BF GD GA
# 24
dA BF GD GA dA BF GD GA
# 32
dA BF GD GA dA BF GD GA
# 40
dA BF GD GA dA BF GD GA
# 48
dA BF GD GA dA BF GD GA
# 56
dA BF GD GA dA BF GD GA
# 64
dA BF GD GA dA BF GD GA
# 72
dA BF GD GA dA BF GD GA
# 80
dA BF GD GA dA BF GD GA
# 88
dA BF GD GA dA BF GD GA
# 96
dA BF GD GA dA BF GD GA
# 104
dA BF GD GA dA BF GD GA
# 112
dA BF GD GA d1
END

Notes = { "C" => 3+1, "D" => 5, "E" => 7, "F" => 8+1, "G" => 10, "A" => 12, "B" => 14 }
Parser = /\G(?:
  L(?<default_length>\d+)
  | (?<lower>_)?(?<upper>\^)?(?<note>[A-GRv])(?<flat>-)?(?<length>\d*)(?<point>\.)?
)\s*/ix

violin, vlc = [[violin, 0], [vlc, 2]].map do |score, n|
  notes = []
  default_length = 4
  score.scan(Parser) do |a|
    case
    when $~[:default_length]
      default_length = $~[:default_length].to_i
    when $~[:note]
      if $~[:note].upcase == "R"
        note = nil
      elsif $~[:note] == "v"
        volume = $~[:length].to_i
        notes << [(volume - 40) / 10]
        next
      else
        note = Notes[$~[:note].upcase] - n * 12
        note += 12 if $~[:note] == $~[:note].downcase
        note -= 12 if $~[:lower]
        note += 12 if $~[:upper]
        note -= 1 if $~[:flat]
      end
      length = $~[:length].to_i
      length = default_length if length == 0
      if $~[:point]
        length *= 2
      else
        length *= 3
      end
      notes << [note, length]
    end
  end
  #notes[-1][1] = 0.5
  notes
end

#   2: 1, 0
#   4: 2, 0
#   3: 0, 1
#   6: 1, 1
#  12: 2, 1
#  24: 3, 1
#  48: 4, 1
#   9: 0, 2
#  18: 1, 2
#  36: 2, 2
#  72: 3, 2
# 228: 5, 2
prev_note = 6
prev_len = 6
codes = []
violin.each do |note, len|
  if len
    diff_len = (prev_len.to_r / len.to_r * 12).round
    e = 0
    while diff_len % 2 == 0
      e += 1
      diff_len /= 2
    end
    while diff_len % 3 == 0
      e += 5
      diff_len /= 3
    end
    len_code = e + 5
    if note
      diff_note = note - prev_note
      note_code = diff_note + 12 + 1
    else
      note_code = 0
    end
    codes << len_code << note_code
    prev_note = note if note
  else
    codes << note # volume
  end
  prev_len = len if len
end
MUSIC = codes.map {|c| c + 93 }.pack("C*").reverse
MUSIC_K, MUSIC_S, _size = bpe(MUSIC)

s = File.read("rubyconf-credits.tmpl.rb")
s = s.gsub(/^\s*#.*/, "")
s = s.split.join
[:LOGO_K, :LOGO_S, :COLOR_K, :COLOR_S, :MUSIC_K, :MUSIC_S, :MARGIN].each do |v|
  s = s.gsub(/\b#{v}\b/) { Object.const_get(v) }
end
size = s.size
s = %q(0;BEGIN{eval(s=%q~s=s.gsub(/\e\[\d+m/,"");eval((%w\C="0;BEGIN{eval(s=%q#{126.chr+s+126.chr})}";CODEPADDING\*"").gsub(/\e\[\d+m/,""))~)}).sub("CODE") { s }
s = s.gsub("PADDING", ";" * (TMPL.count("#") - s.size + 7))
print TMPL.tr(".:", "  ").gsub("#") { s.slice!(0, 1) }
$stderr.puts size
