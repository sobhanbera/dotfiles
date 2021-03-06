local M = {}

-- list of all welcome texts available
M.WELCOME_MESSAGE_1 = {
    "         db   d8b   db d88888b db       .o88b.  .d88b.  .88b  d88. d88888b          ",
    "         88   I8I   88 88'     88      d8P  Y8 .8P  Y8. 88'YbdP`88 88'              ",
    "         88   I8I   88 88ooooo 88      8P      88    88 88  88  88 88ooooo          ",
    "         Y8   I8I   88 88~~~~~ 88      8b      88    88 88  88  88 88~~~~~          ",
    "         `8b d8'8b d8' 88.     88booo. Y8b  d8 `8b  d8' 88  88  88 88.              ",
    "          `8b8' `8d8'  Y88888P Y88888P  `Y88P'  `Y88P'  YP  YP  YP Y88888P          ",
    "                                                                                    ",
    ".d8888.  .d88b.  d8888b. db   db  .d8b.  d8b   db   d8888b. d88888b d8888b.  .d8b.  ",
    "88'  YP .8P  Y8. 88  `8D 88   88 d8' `8b 888o  88   88  `8D 88'     88  `8D d8' `8b ",
    "`8bo.   88    88 88oooY' 88ooo88 88ooo88 88V8o 88   88oooY' 88ooooo 88oobY' 88ooo88 ",
    "  `Y8b. 88    88 88~~~b. 88~~~88 88~~~88 88 V8o88   88~~~b. 88~~~~~ 88`8b   88~~~88 ",
    "db   8D `8b  d8' 88   8D 88   88 88   88 88  V888   88   8D 88.     88 `88. 88   88 ",
    "`8888Y'  `Y88P'  Y8888P' YP   YP YP   YP VP   V8P   Y8888P' Y88888P 88   YD YP   YP ",
}

M.WELCOME_MESSAGE_2 = {
    "                      888       888 8888888888 888       .d8888b.   .d88888b.  888b     d888 8888888888                ",
    "                      888   o   888 888        888      d88P  Y88b d88P' 'Y88b 8888b   d8888 888                       ",
    "                      888  d8b  888 888        888      888    888 888     888 88888b.d88888 888                       ",
    "                      888 d888b 888 8888888    888      888        888     888 888Y88888P888 8888888                   ",
    "                      888d88888b888 888        888      888        888     888 888 Y888P 888 888                       ",
    "                      88888P Y88888 888        888      888    888 888     888 888  Y8P  888 888                       ",
    "                      8888P   Y8888 888        888      Y88b  d88P Y88b. .d88P 888   '   888 888                       ",
    "                      888P     Y888 8888888888 88888888  'Y8888P'   'Y88888P'  888       888 8888888888                ",
    "                                                                                                                       ",
    " .d8888b.   .d88888b.  888888b.   888    888        d8888 888b    888     888888b.   8888888888 8888888b.         d8888",
    "d88P  Y88b d88P' 'Y88b 888  '88b  888    888       d88888 8888b   888     888  '88b  888        888   Y88b       d88888",
    "Y88b.      888     888 888  .88P  888    888      d88P888 88888b  888     888  .88P  888        888    888      d88P888",
    " 'Y888b.   888     888 8888888K.  8888888888     d88P 888 888Y88b 888     8888888K.  8888888    888   d88P     d88P 888",
    "    'Y88b. 888     888 888  'Y88b 888    888    d88P  888 888 Y88b888     888  'Y88b 888        8888888P'     d88P  888",
    "      '888 888     888 888    888 888    888   d88P   888 888  Y88888     888    888 888        888 T88b     d88P   888",
    "Y88b  d88P Y88b. .d88P 888   d88P 888    888  d8888888888 888   Y8888     888   d88P 888        888  T88b   d8888888888",
    " 'Y8888P'   'Y88888P'  8888888P'  888    888 d88P     888 888    Y888     8888888P'  8888888888 888   T88b d88P     888",
}

M.WELCOME_MESSAGE_3 = {
    "                            ___          ___                       ___          ___          ___          ___                               ",
    "                           /__/\\        /  /\\                     /  /\\        /  /\\        /__/\\        /  /\\                              ",
    "                          _\\_ \\:\\      /  /:/_                   /  /:/       /  /::\\      |  |::\\      /  /:/_                             ",
    "                         /__/\\ \\:\\    /  /:/ /\\   ___     ___   /  /:/       /  /:/\\:\\     |  |:|:\\    /  /:/ /\\                            ",
    "                        _\\_ \\:\\ \\:\\  /  /:/ /:/_ /__/\\   /  /\\ /  /:/  ___  /  /:/  \\:\\  __|__|:|\\:\\  /  /:/ /:/_                           ",
    "                       /__/\\ \\:\\ \\:\\/__/:/ /:/ /\\\\  \\:\\ /  /://__/:/  /  /\\/__/:/ \\__\\:\\/__/::::| \\:\\/__/:/ /:/ /\\                          ",
    "                       \\  \\:\\ \\:\\/:/\\  \\:\\/:/ /:/ \\  \\:\\  /:/ \\  \\:\\ /  /:/\\  \\:\\ /  /:/\\  \\:\\~~\\__\\/\\  \\:\\/:/ /:/                          ",
    "                        \\  \\:\\ \\::/  \\  \\::/ /:/   \\  \\:\\/:/   \\  \\:\\  /:/  \\  \\:\\  /:/  \\  \\:\\       \\  \\::/ /:/                           ",
    "                         \\  \\:\\/:/    \\  \\:\\/:/     \\  \\::/     \\  \\:\\/:/    \\  \\:\\/:/    \\  \\:\\       \\  \\:\\/:/                            ",
    "                          \\  \\::/      \\  \\::/       \\__\\/       \\  \\::/      \\  \\::/      \\  \\:\\       \\  \\::/                             ",
    "                           \\__\\/        \\__\\/                     \\__\\/        \\__\\/        \\__\\/        \\__\\/                              ",
    "                                                                                                                                                          ",
    "      ___          ___                       ___          ___          ___                                ___          ___          ___     ",
    "     /  /\\        /  /\\        _____        /__/\\        /  /\\        /__/\\                 _____        /  /\\        /  /\\        /  /\\    ",
    "    /  /:/_      /  /::\\      /  /::\\       \\  \\:\\      /  /::\\       \\  \\:\\               /  /::\\      /  /:/_      /  /::\\      /  /::\\   ",
    "   /  /:/ /\\    /  /:/\\:\\    /  /:/\\:\\       \\__\\:\\    /  /:/\\:\\       \\  \\:\\             /  /:/\\:\\    /  /:/ /\\    /  /:/\\:\\    /  /:/\\:\\  ",
    "  /  /:/ /::\\  /  /:/  \\:\\  /  /:/~/::\\  ___ /  /::\\  /  /:/~/::\\  _____\\__\\:\\           /  /:/~/::\\  /  /:/ /:/_  /  /:/~/:/   /  /:/~/::\\ ",
    " /__/:/ /:/\\:\\/__/:/ \\__\\:\\/__/:/ /:/\\:|/__/\\  /:/\\:\\/__/:/ /:/\\:\\/__/::::::::\\         /__/:/ /:/\\:|/__/:/ /:/ /\\/__/:/ /:/___/__/:/ /:/\\:\\",
    " \\  \\:\\/:/~/:/\\  \\:\\ /  /:/\\  \\:\\/:/~/:/\\  \\:\\/:/__\\/\\  \\:\\/:/__\\/\\  \\:\\~~\\~~\\/         \\  \\:\\/:/~/:/\\  \\:\\/:/ /:/\\  \\:\\/:::::/\\  \\:\\/:/__\\/",
    "  \\  \\::/ /:/  \\  \\:\\  /:/  \\  \\::/ /:/  \\  \\::/      \\  \\::/      \\  \\:\\  ~~~           \\  \\::/ /:/  \\  \\::/ /:/  \\  \\::/~~~~  \\  \\::/     ",
    "   \\__\\/ /:/    \\  \\:\\/:/    \\  \\:\\/:/    \\  \\:\\       \\  \\:\\       \\  \\:\\                \\  \\:\\/:/    \\  \\:\\/:/    \\  \\:\\       \\  \\:\\     ",
    "     /__/:/      \\  \\::/      \\  \\::/      \\  \\:\\       \\  \\:\\       \\  \\:\\                \\  \\::/      \\  \\::/      \\  \\:\\       \\  \\:\\    ",
    "     \\__\\/        \\__\\/        \\__\\/        \\__\\/        \\__\\/        \\__\\/                 \\__\\/        \\__\\/        \\__\\/        \\__\\/    ",
}

return M