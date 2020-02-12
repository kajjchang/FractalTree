public void setup() {   
    size(500, 500);
}

public void draw() {   
    background(255);
    stroke(0.59 * 255, 0.29 * 255, 0);   
    strokeWeight(5);
    line(250, 480, 250, 380);   
    drawBranches(250, 380, 80);
}

public void drawBranches(float x, float y, float len) {
    if (len < 25) return;
    float theta = random(PI / 6, PI / 2);
    float end_x_1 = x + cos(theta) * len;
    float end_x_2 = x - cos(theta) * len;
    float end_y = y - sin(theta) * len;
    line(x, y, end_x_1, end_y);
    drawBranches(end_x_1, end_y, len * 0.8);
    line(x, y, end_x_2, end_y);
    drawBranches(end_x_2, end_y, len * 0.8);
    int num_flowers = (int) random(frameCount % 4) + 1;
    for (int i = 0; i < num_flowers; i++) {
        float frac = (float) Math.random();
        drawFlower(x + (end_x_1 - x) * frac, y + (end_y - y) * frac, 5);
        frac = (float) Math.random();
        drawFlower(x + (end_x_2 - x) * frac, y + (end_y - y) * frac, 5);
    }
}


public void drawFlower(float x, float y, float size) {
    if (size < 1) return;
    push();
    stroke(255 - size * 10, 192, 203);
    fill(255 - size * 10, 192, 203);
    for (int i = 0; i <= 12; i++) {
        ellipse(x + cos(i * PI / 6) * size, y + sin(i * PI / 6) * size, size - 1, size - 1);
    }
    pop();
    drawFlower(x, y, size / 2);
}
