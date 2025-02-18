#include <print.h>

const static size_t VGA_WIDTH = 160;
const static size_t VGA_HEIGHT = 50;

struct Char {
    uint8_t character;
    uint8_t color;
};

struct Char* buffer = (struct Char*) 0xB8000;
size_t col = 0;
size_t row = 0;
uint8_t color = PRINT_COLOR_WHITE | PRINT_COLOR_BLACK << 4;

void clear_row(size_t y) {
    struct Char empty = (struct Char) {
        ' ', color
    };
    for (size_t x = 0; x < VGA_WIDTH; x++) {
            const size_t index = y * VGA_WIDTH + x;
            buffer[index].character = ' ';
            buffer[index].color = color;
    }
}

void print_newline() {
    col = 0;
    if (row < VGA_HEIGHT - 1) {
        row++;
        return;
    }
    for (size_t row = 1; row < VGA_HEIGHT - 1; row++) {
        for (size_t col = 0; col < VGA_WIDTH; col++) {
            struct Char character = buffer[col + VGA_WIDTH * row];
            buffer[col + VGA_WIDTH*(row - 1)] = character;
        }

    }
}


void print_clear() {
    for (size_t y = 0; y < VGA_HEIGHT; y++) {
        clear_row(y);
    }
}

void print_char(char character) {
    if (character == '\n') {
        print_newline();
        return;
    }
    if (col > VGA_WIDTH) print_newline();

    buffer[col + VGA_WIDTH * row] = (struct Char) {
        character: (uint8_t) character,
        color: color,
    };
    col++;
}

void print_str(char *str) {
    for (size_t i=0; 1; i++) {
        char character = (uint8_t) str[i];

        if (character == '\0') return;

        print_char(character);

    }
}

void print_set_color(uint8_t foreground, uint8_t background) {
    color = foreground  + (background << 4);
}
