#include "window.h"

Window::Window(QWidget *parent)
    : QWidget(parent),
      button(new QPushButton("Hello", this)),
      lable(new QLabel("label", this))
{
    resize(800, 600);
    button->move(200, 300);
    button->resize(100, 50);
    connect(button, &QPushButton::clicked, this, [this](){this->lable->setText("Hello World!");this->lable->adjustSize();});
}



