#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget), timer(new QTimer)
{
    ui->setupUi(this);
    ui->pushButton->setText("hello");
    ui->lcdNumber->setDigitCount(8);
    connect(timer, &QTimer::timeout, this , &Widget::setPicture);
    timer->start(1000);
//    connect(ui->pushButton, &QPushButton::clicked, this, &Widget::setPicture);
}

Widget::~Widget()
{
    delete ui;
}

void Widget::setPicture()
{
//    ui->label->setPixmap(QPixmap("d:/xuelaoshi.jpg"));

//    ui->label->setText();
    ui->lcdNumber->display(QTime::currentTime().toString("HH:mm:ss"));
}
