 QApplication a(argc, argv);
    MainWindow w;
    QPixmap pixmap("C:/Users/Liorkin/Desktop/prev.png");
       QSplashScreen splash(pixmap, Qt::WindowStaysOnTopHint);
       splash.show();
       QTimer::singleShot(3000, &splash, &QWidget::close); // keep displayed for 5 seconds
       QThread::sleep(3);
       w.show();



QProcess PROCESS;
    PROCESS.start("bash", {"-c", "/usr/sbin/ip l | /usr/bin/grep \\< | /usr/bin/awk '{print $2}' | /usr/bin/cut -d: -f1 | /usr/bin/tail -n +2"},QIODevice::ReadOnly);
    PROCESS.waitForFinished(-1);

    if (PROCESS.exitCode())
        return;

    QString INTERFACES_NAMES = PROCESS.readAllStandardOutput();

sudo pg_ctlcluster 11 main start --skip-systemctl-redirect
