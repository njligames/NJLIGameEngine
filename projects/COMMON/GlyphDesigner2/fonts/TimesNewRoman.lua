local Font = {}

Font.info = 
    {
    face              = "Times New Roman",
    file              = "TimesNewRoman.png",
    size              = 64,
    bold              = 0,
    italic            = 0,
    charset           = "",
    unicode           = 0,
    stretchH          = 100,
    smooth            = 1,
    aa                = 1,
    padding           = {0, 0, 0, 0},
    spacing           = 2,
    charsCount        = 95,
    kerningsCounts    = 104,
    }

Font.common =
    {
    lineHeight        = 71,
    base              = 60,
    scaleW            = 359,
    scaleH            = 446,
    pages             = 1,
    packed            = 0,
    }

Font.chars =
    {
    {id=32,x=125,y=424,width=0,height=0,xoffset=0,yoffset=58,xadvance=16,page=0,chnl=0,letter="space"},
    {id=33,x=2,y=164,width=10,height=47,xoffset=7,yoffset=12,xadvance=21,page=0,chnl=0,letter="!"},
    {id=34,x=260,y=390,width=20,height=21,xoffset=4,yoffset=12,xadvance=26,page=0,chnl=0,letter=string.char(34)},
    {id=35,x=38,y=115,width=32,height=47,xoffset=1,yoffset=12,xadvance=32,page=0,chnl=0,letter="#"},
    {id=36,x=260,y=2,width=28,height=53,xoffset=3,yoffset=10,xadvance=32,page=0,chnl=0,letter="$"},
    {id=37,x=290,y=2,width=51,height=48,xoffset=2,yoffset=12,xadvance=53,page=0,chnl=0,letter="%"},
    {id=38,x=115,y=65,width=48,height=47,xoffset=2,yoffset=12,xadvance=50,page=0,chnl=0,letter="&"},
    {id=39,x=282,y=390,width=9,height=21,xoffset=3,yoffset=12,xadvance=12,page=0,chnl=0,letter="'"},
    {id=40,x=61,y=2,width=20,height=61,xoffset=3,yoffset=11,xadvance=21,page=0,chnl=0,letter="("},
    {id=41,x=83,y=2,width=20,height=61,xoffset=1,yoffset=11,xadvance=21,page=0,chnl=0,letter=")"},
    {id=42,x=201,y=390,width=25,height=28,xoffset=5,yoffset=11,xadvance=32,page=0,chnl=0,letter="*"},
    {id=43,x=292,y=308,width=36,height=36,xoffset=1,yoffset=18,xadvance=36,page=0,chnl=0,letter="+"},
    {id=44,x=293,y=390,width=12,height=19,xoffset=3,yoffset=50,xadvance=16,page=0,chnl=0,letter=","},
    {id=45,x=66,y=424,width=19,height=7,xoffset=3,yoffset=39,xadvance=21,page=0,chnl=0,letter="-"},
    {id=46,x=55,y=424,width=9,height=9,xoffset=5,yoffset=50,xadvance=16,page=0,chnl=0,letter="."},
    {id=47,x=71,y=65,width=20,height=48,xoffset=0,yoffset=11,xadvance=18,page=0,chnl=0,letter="/"},
    {id=48,x=105,y=115,width=30,height=47,xoffset=2,yoffset=12,xadvance=32,page=0,chnl=0,letter="0"},
    {id=49,x=188,y=213,width=19,height=46,xoffset=8,yoffset=12,xadvance=32,page=0,chnl=0,letter="1"},
    {id=50,x=68,y=213,width=30,height=46,xoffset=1,yoffset=12,xadvance=32,page=0,chnl=0,letter="2"},
    {id=51,x=229,y=115,width=27,height=47,xoffset=3,yoffset=12,xadvance=32,page=0,chnl=0,letter="3"},
    {id=52,x=2,y=213,width=31,height=46,xoffset=1,yoffset=12,xadvance=32,page=0,chnl=0,letter="4"},
    {id=53,x=131,y=213,width=27,height=46,xoffset=3,yoffset=13,xadvance=32,page=0,chnl=0,letter="5"},
    {id=54,x=137,y=115,width=29,height=47,xoffset=3,yoffset=12,xadvance=32,page=0,chnl=0,letter="6"},
    {id=55,x=100,y=213,width=29,height=46,xoffset=2,yoffset=13,xadvance=32,page=0,chnl=0,letter="7"},
    {id=56,x=258,y=115,width=27,height=47,xoffset=4,yoffset=12,xadvance=32,page=0,chnl=0,letter="8"},
    {id=57,x=168,y=115,width=29,height=47,xoffset=3,yoffset=12,xadvance=32,page=0,chnl=0,letter="9"},
    {id=58,x=223,y=355,width=10,height=33,xoffset=6,yoffset=26,xadvance=18,page=0,chnl=0,letter=":"},
    {id=59,x=256,y=308,width=12,height=43,xoffset=4,yoffset=26,xadvance=18,page=0,chnl=0,letter=";"},
    {id=60,x=2,y=355,width=36,height=33,xoffset=1,yoffset=19,xadvance=36,page=0,chnl=0,letter="<"},
    {id=61,x=307,y=390,width=36,height=15,xoffset=1,yoffset=28,xadvance=36,page=0,chnl=0,letter="="},
    {id=62,x=40,y=355,width=36,height=33,xoffset=1,yoffset=19,xadvance=36,page=0,chnl=0,letter=">"},
    {id=63,x=287,y=115,width=25,height=47,xoffset=3,yoffset=12,xadvance=28,page=0,chnl=0,letter="?"},
    {id=64,x=2,y=2,width=57,height=61,xoffset=3,yoffset=11,xadvance=59,page=0,chnl=0,letter="@"},
    {id=65,x=129,y=164,width=48,height=46,xoffset=1,yoffset=12,xadvance=46,page=0,chnl=0,letter="A"},
    {id=66,x=243,y=261,width=41,height=45,xoffset=1,yoffset=13,xadvance=43,page=0,chnl=0,letter="B"},
    {id=67,x=259,y=65,width=41,height=47,xoffset=2,yoffset=12,xadvance=43,page=0,chnl=0,letter="C"},
    {id=68,x=149,y=261,width=45,height=45,xoffset=1,yoffset=13,xadvance=46,page=0,chnl=0,letter="D"},
    {id=69,x=286,y=261,width=39,height=45,xoffset=1,yoffset=13,xadvance=39,page=0,chnl=0,letter="E"},
    {id=70,x=161,y=308,width=34,height=45,xoffset=1,yoffset=13,xadvance=36,page=0,chnl=0,letter="F"},
    {id=71,x=165,y=65,width=46,height=47,xoffset=2,yoffset=12,xadvance=46,page=0,chnl=0,letter="G"},
    {id=72,x=101,y=261,width=46,height=45,xoffset=1,yoffset=13,xadvance=46,page=0,chnl=0,letter="H"},
    {id=73,x=233,y=308,width=21,height=45,xoffset=2,yoffset=13,xadvance=21,page=0,chnl=0,letter="I"},
    {id=74,x=160,y=213,width=26,height=46,xoffset=1,yoffset=13,xadvance=25,page=0,chnl=0,letter="J"},
    {id=75,x=268,y=213,width=48,height=45,xoffset=1,yoffset=13,xadvance=46,page=0,chnl=0,letter="K"},
    {id=76,x=2,y=308,width=39,height=45,xoffset=1,yoffset=13,xadvance=39,page=0,chnl=0,letter="L"},
    {id=77,x=209,y=213,width=57,height=45,xoffset=1,yoffset=13,xadvance=57,page=0,chnl=0,letter="M"},
    {id=78,x=78,y=164,width=49,height=46,xoffset=-1,yoffset=13,xadvance=46,page=0,chnl=0,letter="N"},
    {id=79,x=213,y=65,width=44,height=47,xoffset=2,yoffset=12,xadvance=46,page=0,chnl=0,letter="O"},
    {id=80,x=124,y=308,width=35,height=45,xoffset=1,yoffset=13,xadvance=36,page=0,chnl=0,letter="P"},
    {id=81,x=214,y=2,width=44,height=58,xoffset=2,yoffset=13,xadvance=46,page=0,chnl=0,letter="Q"},
    {id=82,x=196,y=261,width=45,height=45,xoffset=1,yoffset=13,xadvance=43,page=0,chnl=0,letter="R"},
    {id=83,x=72,y=115,width=31,height=47,xoffset=4,yoffset=12,xadvance=36,page=0,chnl=0,letter="S"},
    {id=84,x=84,y=308,width=38,height=45,xoffset=2,yoffset=13,xadvance=39,page=0,chnl=0,letter="T"},
    {id=85,x=179,y=164,width=48,height=46,xoffset=0,yoffset=13,xadvance=46,page=0,chnl=0,letter="U"},
    {id=86,x=229,y=164,width=47,height=46,xoffset=1,yoffset=13,xadvance=46,page=0,chnl=0,letter="V"},
    {id=87,x=14,y=164,width=62,height=46,xoffset=1,yoffset=13,xadvance=60,page=0,chnl=0,letter="W"},
    {id=88,x=2,y=261,width=48,height=45,xoffset=0,yoffset=13,xadvance=46,page=0,chnl=0,letter="X"},
    {id=89,x=52,y=261,width=47,height=45,xoffset=1,yoffset=13,xadvance=46,page=0,chnl=0,letter="Y"},
    {id=90,x=43,y=308,width=39,height=45,xoffset=1,yoffset=13,xadvance=39,page=0,chnl=0,letter="Z"},
    {id=91,x=178,y=2,width=16,height=59,xoffset=5,yoffset=12,xadvance=21,page=0,chnl=0,letter="["},
    {id=92,x=93,y=65,width=20,height=48,xoffset=0,yoffset=11,xadvance=18,page=0,chnl=0,letter=string.char(92)},
    {id=93,x=196,y=2,width=16,height=59,xoffset=2,yoffset=12,xadvance=21,page=0,chnl=0,letter="]"},
    {id=94,x=228,y=390,width=30,height=25,xoffset=1,yoffset=12,xadvance=30,page=0,chnl=0,letter="^"},
    {id=95,x=87,y=424,width=36,height=5,xoffset=-1,yoffset=67,xadvance=32,page=0,chnl=0,letter="_"},
    {id=96,x=2,y=424,width=13,height=13,xoffset=4,yoffset=12,xadvance=21,page=0,chnl=0,letter="`"},
    {id=97,x=110,y=355,width=29,height=33,xoffset=2,yoffset=26,xadvance=28,page=0,chnl=0,letter="a"},
    {id=98,x=37,y=65,width=32,height=48,xoffset=0,yoffset=11,xadvance=32,page=0,chnl=0,letter="b"},
    {id=99,x=141,y=355,width=27,height=33,xoffset=2,yoffset=26,xadvance=28,page=0,chnl=0,letter="c"},
    {id=100,x=2,y=65,width=33,height=48,xoffset=2,yoffset=11,xadvance=32,page=0,chnl=0,letter="d"},
    {id=101,x=170,y=355,width=27,height=33,xoffset=2,yoffset=26,xadvance=28,page=0,chnl=0,letter="e"},
    {id=102,x=199,y=115,width=28,height=47,xoffset=2,yoffset=11,xadvance=21,page=0,chnl=0,letter="f"},
    {id=103,x=35,y=213,width=31,height=46,xoffset=2,yoffset=26,xadvance=32,page=0,chnl=0,letter="g"},
    {id=104,x=302,y=65,width=34,height=47,xoffset=0,yoffset=11,xadvance=32,page=0,chnl=0,letter="h"},
    {id=105,x=314,y=115,width=17,height=47,xoffset=2,yoffset=11,xadvance=18,page=0,chnl=0,letter="i"},
    {id=106,x=105,y=2,width=20,height=61,xoffset=-5,yoffset=11,xadvance=18,page=0,chnl=0,letter="j"},
    {id=107,x=2,y=115,width=34,height=47,xoffset=1,yoffset=11,xadvance=32,page=0,chnl=0,letter="k"},
    {id=108,x=333,y=115,width=17,height=47,xoffset=2,yoffset=11,xadvance=18,page=0,chnl=0,letter="l"},
    {id=109,x=235,y=355,width=51,height=32,xoffset=1,yoffset=26,xadvance=50,page=0,chnl=0,letter="m"},
    {id=110,x=2,y=390,width=34,height=32,xoffset=0,yoffset=26,xadvance=32,page=0,chnl=0,letter="n"},
    {id=111,x=78,y=355,width=30,height=33,xoffset=2,yoffset=26,xadvance=32,page=0,chnl=0,letter="o"},
    {id=112,x=278,y=164,width=33,height=46,xoffset=0,yoffset=26,xadvance=32,page=0,chnl=0,letter="p"},
    {id=113,x=313,y=164,width=32,height=46,xoffset=2,yoffset=26,xadvance=32,page=0,chnl=0,letter="q"},
    {id=114,x=109,y=390,width=24,height=32,xoffset=0,yoffset=26,xadvance=21,page=0,chnl=0,letter="r"},
    {id=115,x=199,y=355,width=22,height=33,xoffset=3,yoffset=26,xadvance=25,page=0,chnl=0,letter="s"},
    {id=116,x=270,y=308,width=20,height=41,xoffset=1,yoffset=17,xadvance=18,page=0,chnl=0,letter="t"},
    {id=117,x=38,y=390,width=34,height=32,xoffset=0,yoffset=27,xadvance=32,page=0,chnl=0,letter="u"},
    {id=118,x=74,y=390,width=33,height=32,xoffset=1,yoffset=27,xadvance=32,page=0,chnl=0,letter="v"},
    {id=119,x=288,y=355,width=48,height=32,xoffset=0,yoffset=27,xadvance=46,page=0,chnl=0,letter="w"},
    {id=120,x=135,y=390,width=33,height=31,xoffset=1,yoffset=27,xadvance=32,page=0,chnl=0,letter="x"},
    {id=121,x=197,y=308,width=34,height=45,xoffset=0,yoffset=27,xadvance=32,page=0,chnl=0,letter="y"},
    {id=122,x=170,y=390,width=29,height=31,xoffset=1,yoffset=27,xadvance=28,page=0,chnl=0,letter="z"},
    {id=123,x=127,y=2,width=20,height=61,xoffset=9,yoffset=11,xadvance=31,page=0,chnl=0,letter="{"},
    {id=124,x=171,y=2,width=5,height=61,xoffset=5,yoffset=11,xadvance=13,page=0,chnl=0,letter="|"},
    {id=125,x=149,y=2,width=20,height=61,xoffset=6,yoffset=11,xadvance=31,page=0,chnl=0,letter="}"},
    {id=126,x=17,y=424,width=36,height=11,xoffset=1,yoffset=35,xadvance=35,page=0,chnl=0,letter="~"},
    }

Font.kerning =
    {
    {first=84, second=65, amount=-5},
    {first=87, second=58, amount=-2},
    {first=76, second=89, amount=-6},
    {first=89, second=105, amount=-3},
    {first=82, second=87, amount=-3},
    {first=86, second=46, amount=-8},
    {first=86, second=65, amount=-8},
    {first=89, second=59, amount=-5},
    {first=87, second=46, amount=-5},
    {first=87, second=65, amount=-7},
    {first=89, second=112, amount=-5},
    {first=65, second=119, amount=-5},
    {first=80, second=44, amount=-7},
    {first=84, second=79, amount=-1},
    {first=32, second=89, amount=-2},
    {first=49, second=49, amount=-2},
    {first=65, second=84, amount=-7},
    {first=89, second=58, amount=-5},
    {first=80, second=32, amount=-2},
    {first=65, second=118, amount=-4},
    {first=84, second=44, amount=-4},
    {first=89, second=46, amount=-8},
    {first=89, second=65, amount=-7},
    {first=114, second=46, amount=-3},
    {first=84, second=101, amount=-4},
    {first=65, second=87, amount=-5},
    {first=84, second=97, amount=-4},
    {first=82, second=89, amount=-3},
    {first=76, second=121, amount=-3},
    {first=89, second=118, amount=-6},
    {first=86, second=44, amount=-8},
    {first=114, second=103, amount=-1},
    {first=84, second=32, amount=-1},
    {first=86, second=101, amount=-7},
    {first=87, second=44, amount=-5},
    {first=86, second=97, amount=-7},
    {first=76, second=86, amount=-5},
    {first=87, second=101, amount=-5},
    {first=87, second=97, amount=-5},
    {first=86, second=32, amount=-1},
    {first=118, second=46, amount=-4},
    {first=87, second=32, amount=-1},
    {first=70, second=46, amount=-5},
    {first=102, second=102, amount=-1},
    {first=70, second=65, amount=-4},
    {first=84, second=111, amount=-4},
    {first=89, second=113, amount=-7},
    {first=65, second=32, amount=-3},
    {first=89, second=44, amount=-8},
    {first=114, second=44, amount=-2},
    {first=119, second=46, amount=-4},
    {first=86, second=111, amount=-8},
    {first=65, second=89, amount=-5},
    {first=84, second=99, amount=-4},
    {first=32, second=86, amount=-1},
    {first=89, second=97, amount=-6},
    {first=87, second=111, amount=-5},
    {first=84, second=114, amount=-2},
    {first=89, second=101, amount=-6},
    {first=121, second=46, amount=-4},
    {first=89, second=32, amount=-2},
    {first=82, second=121, amount=-2},
    {first=84, second=45, amount=-5},
    {first=86, second=114, amount=-3},
    {first=76, second=84, amount=-5},
    {first=118, second=44, amount=-4},
    {first=84, second=121, amount=-4},
    {first=87, second=114, amount=-2},
    {first=84, second=117, amount=-2},
    {first=82, second=86, amount=-5},
    {first=86, second=45, amount=-5},
    {first=70, second=44, amount=-5},
    {first=87, second=45, amount=-3},
    {first=86, second=121, amount=-7},
    {first=86, second=117, amount=-3},
    {first=89, second=111, amount=-6},
    {first=76, second=87, amount=-4},
    {first=84, second=105, amount=-2},
    {first=87, second=121, amount=-3},
    {first=87, second=117, amount=-2},
    {first=119, second=44, amount=-4},
    {first=84, second=59, amount=-3},
    {first=32, second=65, amount=-3},
    {first=86, second=105, amount=-3},
    {first=32, second=84, amount=-1},
    {first=87, second=105, amount=-2},
    {first=65, second=121, amount=-5},
    {first=121, second=44, amount=-4},
    {first=80, second=46, amount=-7},
    {first=86, second=59, amount=-4},
    {first=80, second=65, amount=-5},
    {first=89, second=45, amount=-7},
    {first=87, second=59, amount=-2},
    {first=114, second=45, amount=-1},
    {first=84, second=58, amount=-3},
    {first=65, second=86, amount=-8},
    {first=32, second=87, amount=-1},
    {first=84, second=119, amount=-4},
    {first=84, second=115, amount=-4},
    {first=82, second=84, amount=-3},
    {first=89, second=117, amount=-7},
    {first=86, second=58, amount=-4},
    {first=76, second=32, amount=-2},
    {first=84, second=46, amount=-4},
    }

return Font