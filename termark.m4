define(`_reset', `[0m')dnl
define(`_bold', `[1m$1[22m')dnl
define(`_faint', `[2m$1[22m')dnl
define(`_italic', `[3m$1[23m')dnl
define(`_underline', `[4m$1[24m')dnl
define(`_blinking', `[5m$1[25m')dnl
define(`_inverse', `[7m$1[27m')dnl
define(`_hidden', `[8m$1[28m')dnl
define(`_stkout', `[9m$1[29m')dnl
define(`_draw', `(0$1(B')dnl
dnl
define(`_eraseCurToEnd', [0J`')dnl
define(`_eraseToCur', [1J`')dnl
define(`_eraseScreem', [2J`')dnl
define(`_eraseSavedLines', [3J`')dnl
define(`_eraseCurToLineEnd', [0K`')dnl
define(`_eraseLineStartToCur', [1K`')dnl
define(`_eraseLine', [0K`')dnl
dnl
define(`_curHome', `[H')dnl
define(`_curUp', `[$1A')dnl
define(`_curDown', `[$1B')dnl
define(`_curRight', `[$1C')dnl
define(`_curLeft', `[$1D')dnl
define(`_curDownCR', `[$1E')dnl
define(`_curUpCR', `[$1F')dnl
define(`_curUpScroll', ` M')dnl
define(`_curToCol', `[$1G')dnl
define(`_curToPos', `[$1;$2H')dnl
define(`_curSave', ` 7')dnl
define(`_curLoad', ` 8')dnl
define(`_curStatic', _curSave$1_curLoad)dnl
define(`_curOff', `[?25l$1[?25h')dnl
dnl # All color "enums" are written in PascalCase rather than camelCase to avoid potential name collisions
define(`_Default', `39')dnl
define(`_Black', `30')dnl
define(`_Red', `31')dnl
define(`_Green', `32')dnl
define(`_Yellow', `33')dnl
define(`_Blue', `34')dnl
define(`_Magenta', `35')dnl
define(`_Cyan', `36')dnl
define(`_White', `37')dnl
define(`_BrightBlack', `90')dnl
define(`_BrightRed', `91')dnl
define(`_BrightGreen', `92')dnl
define(`_BrightYellow', `93')dnl
define(`_BrightBlue', `94')dnl
define(`_BrightMagenta', `95')dnl
define(`_BrightCyan', `96')dnl
define(`_BrightWhite', `97')dnl
define(`_color4Bit_Set', `[$1;eval($2 + 10)m')dnl # usage: _color4Bit(foreground, background) (use the "color enums" defined above for less pain)
define(`_colorReset', `_color4Bit_Set(_Default, _Default)')dnl
define(`_color8Bit_Set', `38;5;$1;48;5;$2m')dnl # must input number from 0-255 for the two args of _color8bit
define(`_color8BitRGB_Set', `_color8Bit_Set(eval(16 + 36 * $1 + 6 * $2 + $3), eval(16 + 36 * $4 + 6 * $5 + $6)')dnl # args of _color8BitRGB must be ints from 0-5 inclusive, ex: _color8BitRGB(1, 2, 3, 0, 4, 5)
define(`_colorRGB_set', `[38;2;$1;$2;$3;48;2;$4;$5;$6m')dnl # usage: _colorRGB(foreR, foreG, foreB, backR, backG, backB). usage of _8BitRGB_Set is the same except instead of nums from 0-255 inclusive it takes nums from 0-5 inclusive
define(`_color4Bit', `_color4Bit_Set($1, $2)$3`'_colorReset')dnl
define(`_color8Bit', `_color8Bit_Set($1, $2)$3`'_colorReset')dnl
define(`_color8BitRGB', `_color8BitRGB_Set($1, $2, $3, $4, $5, $6)$7_colorReset')dnl
define(`_colorRGB)', `_colorRGB_Set($1, $2, $3, $4, $5, $6)$7_colorReset')dnl
dnl
dnl
_bold(this is bold)
_faint(this is faint)
_italic(this is italic)
_underline(this is underline)
_blinking(this is blinking)
_inverse(this is inverse)
_hidden(this is hidden)
_stkout(this is stkout)
_draw(qqqqqqq)
_color4Bit(_Blue, _Red, `hi mom')
