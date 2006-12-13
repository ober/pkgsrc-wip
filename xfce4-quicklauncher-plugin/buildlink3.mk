# $NetBSD: buildlink3.mk,v 1.4 2006/12/13 04:55:00 dhowland Exp $

BUILDLINK_DEPTH:=				${BUILDLINK_DEPTH}+
XFCE4_QUICKLAUNCHER_PLUGIN_BUILDLINK3_MK:=	${XFCE4_QUICKLAUNCHER_PLUGIN_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	xfce4-quicklauncher-plugin
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-quicklauncher-plugin}
BUILDLINK_PACKAGES+=	xfce4-quicklauncher-plugin
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}xfce4-quicklauncher-plugin

.if ${XFCE4_QUICKLAUNCHER_PLUGIN_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.xfce4-quicklauncher-plugin+=	xfce4-quicklauncher-plugin>=1.9.1
BUILDLINK_PKGSRCDIR.xfce4-quicklauncher-plugin?=	../../wip/xfce4-quicklauncher-plugin
.endif	# XFCE4_QUICKLAUNCHER_PLUGIN_BUILDLINK3_MK

#.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../wip/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=				${BUILDLINK_DEPTH:S/+$//}
