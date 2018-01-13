#include <stdio.h>
#include <opencv2/opencv.hpp>

using namespace cv;

int main(int argc, char** argv){
    if(argc != 2) {
        printf("Need a image");
        return -1;
    }
    Mat img;
    img = imread(argv[1]);
    imshow("Display", img);

    waitKey(0);

    return 0;
}
