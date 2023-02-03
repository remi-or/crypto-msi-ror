#include <string.h>
#include <time.h>

#include "pgm.c"

#define FNMAX 255
#define MAX_IMGS 64

void read_look_up_table(char *path, unsigned char *lut) {
    FILE *src = fopen(path, "r");
    if (src == NULL) {
        perror(path);
        exit(EXIT_FAILURE);
    }
    int n = 0;
    unsigned char val;
    while (fread(&val, 1, 1, src) != 0) {
        lut[n] = val;
        n++;
    }
    fclose(src);
}

void transfo(int w, int h, unsigned char *buffer, unsigned char *lut, unsigned char val) {
    long size = (long) w * (long) h;
    long k;
    unsigned char current;
    for (k = 0; k < size; k++) {
        current = buffer[k];
        current = lut[current];
        buffer[k] = (((int) current + val) > 255) ? 255 : current + val;
    }
}

void transform_image(char *img_path, char *curve, int light, char *save_path) {
    // Open the look up table
    unsigned char *lut = (unsigned char *)malloc(sizeof(unsigned char) * 256);
    read_look_up_table(curve, lut);
    // Open the image
    FILE *src;
    int width, height;
    open_pgm(img_path, &src, &width, &height);
    // Print its size
    long size = width * height;
    printf("%dw * %dh = %ld pixels\n", width, height, size);
    // Prepare the buffer
    unsigned char *buffer = malloc(size * sizeof(unsigned char));
    read_pgm(src, buffer, size);
    // Transform the buffer
    transfo(width, height, buffer, lut, light);
    // Write the buffer down
    write_pgm(save_path, buffer, width, height, 255);
    free(buffer);
    free(lut);
}

int main(int argc, char *argv[]) {
    // Setup
    FILE *todo = fopen(argv[1], "r");
    if (todo == NULL) {
        perror(argv[1]);
        exit(EXIT_FAILURE);
    }
    char source[FNMAX];
    char curve[FNMAX];
    char dest[FNMAX];
    int light;
    // Start timing
    double t = clock();
    while (fscanf(todo, "%s %s %d %s", source, curve, &light, dest) == 4) {
        printf("%s %s %d %s\n", source, curve, light, dest);
        transform_image(source, curve, light, dest);
    }
    // Results
    t = (clock() - t);
    printf("Time ellapsed: %f", t);
}