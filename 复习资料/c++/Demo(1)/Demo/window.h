#ifndef WINDOW_H
#define WINDOW_H

#include <QWidget>
#include <QLabel>
#include <QPushButton>

class Window : public QWidget
{
    Q_OBJECT
public:
    Window(QWidget *parent = nullptr);
private:
    QPushButton *button;
    QLabel *lable;
};

#endif // WINDOW_H
