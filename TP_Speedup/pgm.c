#include <processthreadsapi.h>
#include <stdio.h>
#include <stdlib.h>

void open_pgm(char *path, FILE **src, int *width, int *height) {
    char c1, c2;
    int maxval;
    *src = fopen(path, "rb");
    if (!*src) {
        fprintf(stderr, "Unable to open file %s\n", path);
        exit(EXIT_FAILURE);
    }
    fscanf(*src, "%c %c", &c1, &c2);
    if (c1 != 'P' && c2 != '5') {
        fprintf(stderr, "File is not a .pgm");
        exit(EXIT_FAILURE);
    }
    fscanf(*src, "%d %d", width, height);
    fscanf(*src, "%d", &maxval);
    if (maxval > 255) {
        fprintf(stderr, "File has a value over 256.");
        exit(EXIT_FAILURE);
    }
}

void read_pgm(FILE *src, unsigned char *dst, long size) {
    fseek(src, 1, SEEK_CUR);
    long rcode = fread(dst, 1, size, src);
    if (rcode != size) {
        perror("fread");
        exit(EXIT_FAILURE);
    }
}

void write_pgm(char *path, unsigned char *img, int width, int height, int maxval) {
    FILE *file = fopen(path, "wb");
    if (!file) {
        printf("Failed to open the out file.\n");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "P5\n%d\n%d\n%d\n", width, height, maxval);
    long size = (long)width * height;
    long written_size = fwrite(img, 1, size, file);
    if (written_size != size) {
        perror("fwrite");
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

int compare_pgms(char *path1, char *path2) {
    // Open the two files
    FILE *pgm1, *pgm2;
    int width1, height1, width2, height2;
    open_pgm(path1, &pgm1, &width1, &height1);
    open_pgm(path2, &pgm2, &width2, &height2);
    // Compare their dimensions
    if (width1 != width2) {
        printf("width1 = %d != %d = width2\n", width1, width2);
        return 0;
    }
    if (height1 != height2) {
        printf("height1 = %d != %d = height2\n", height1, height2);
        return 0;
    }
    // Read until difference is visible
    long i;
    unsigned char buffer1, buffer2;
    int rcode1, rcode2;
    fseek(pgm1, 1, SEEK_CUR);
    fseek(pgm2, 1, SEEK_CUR);
    for (i = 0; i < (long)width1 * height1; i++) {
        rcode1 = fread(&buffer1, 1, 1, pgm1);
        rcode2 = fread(&buffer2, 1, 1, pgm2);
        if (rcode1 != 1 || rcode2 != 1) {
            perror("fread");
            printf("rcodes %d %d", rcode1, rcode2);
            exit(EXIT_FAILURE);
        }
        if (buffer1 != buffer2) {
            printf("Bytes %ld differ: %c != %c", i, buffer1, buffer2);
            return 0;
        }
    }
    return 1;
}