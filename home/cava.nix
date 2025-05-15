{ colors, ... }:

{
    programs.cava = {
        enable = true;
        settings = {
            color = with colors; {
                gradient = 1;
                gradient_color_8 = "'#${flamingo}'";
                gradient_color_7 = "'#${pink}'";
                gradient_color_6 = "'#${red}'";
                gradient_color_5 = "'#${peach}'";
                gradient_color_4 = "'#${green}'";
                gradient_color_3 = "'#${sky}'";
                gradient_color_2 = "'#${blue}'";
                gradient_color_1 = "'#${lavender}'";
            };
        };
    };
}
