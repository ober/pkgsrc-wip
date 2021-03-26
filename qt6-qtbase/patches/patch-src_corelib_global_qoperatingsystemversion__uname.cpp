$NetBSD$

* use uname to get QOperatingSystemVersion on Free and NetBSD

--- src/corelib/global/qoperatingsystemversion_uname.cpp.orig	2021-03-05 22:33:51.055078786 +0000
+++ src/corelib/global/qoperatingsystemversion_uname.cpp
@@ -0,0 +1,60 @@
+/****************************************************************************
+**
+** Copyright (C) 2021 The Qt Company Ltd.
+** Contact: https://www.qt.io/licensing/
+**
+** This file is part of the QtCore module of the Qt Toolkit.
+**
+** $QT_BEGIN_LICENSE:LGPL$
+** Commercial License Usage
+** Licensees holding valid commercial Qt licenses may use this file in
+** accordance with the commercial license agreement provided with the
+** Software or, alternatively, in accordance with the terms contained in
+** a written agreement between you and The Qt Company. For licensing terms
+** and conditions see https://www.qt.io/terms-conditions. For further
+** information use the contact form at https://www.qt.io/contact-us.
+**
+** GNU Lesser General Public License Usage
+** Alternatively, this file may be used under the terms of the GNU Lesser
+** General Public License version 3 as published by the Free Software
+** Foundation and appearing in the file LICENSE.LGPL3 included in the
+** packaging of this file. Please review the following information to
+** ensure the GNU Lesser General Public License version 3 requirements
+** will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
+**
+** GNU General Public License Usage
+** Alternatively, this file may be used under the terms of the GNU
+** General Public License version 2.0 or (at your option) the GNU General
+** Public license version 3 or any later version approved by the KDE Free
+** Qt Foundation. The licenses are as published by the Free Software
+** Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
+** included in the packaging of this file. Please review the following
+** information to ensure the GNU General Public License requirements will
+** be met: https://www.gnu.org/licenses/gpl-2.0.html and
+** https://www.gnu.org/licenses/gpl-3.0.html.
+**
+** $QT_END_LICENSE$
+**
+****************************************************************************/
+
+#include <QtCore/qstring.h>
+#include <QtCore/qversionnumber.h>
+#include <sys/utsname.h>
+#include "qoperatingsystemversion_p.h"
+
+QT_BEGIN_NAMESPACE
+
+QOperatingSystemVersion QOperatingSystemVersion::current()
+{
+    QOperatingSystemVersion v(currentType(), -1);
+    struct utsname u;
+    if (uname(&u) == 0) {
+      QVersionNumber osv = QVersionNumber::fromString(QString::fromLatin1(u.release));
+      v.m_major = osv.majorVersion();
+      v.m_minor = osv.minorVersion();
+      v.m_micro = osv.microVersion();
+    }
+    return v;
+}
+
+QT_END_NAMESPACE