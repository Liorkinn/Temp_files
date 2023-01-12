 QApplication a(argc, argv);
    MainWindow w;
    QPixmap pixmap("C:/Users/Liorkin/Desktop/prev.png");
       QSplashScreen splash(pixmap, Qt::WindowStaysOnTopHint);
       splash.show();
       QTimer::singleShot(3000, &splash, &QWidget::close); // keep displayed for 5 seconds
       QThread::sleep(3);
       w.show();
