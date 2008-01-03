# $NetBSD: buildlink3.mk,v 1.1.1.1 2008/01/03 01:40:54 hoka_adam Exp $
#

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBSIDPLAY_BUILDLINK3_MK:=	${LIBSIDPLAY_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libsidplay
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibsidplay}
BUILDLINK_PACKAGES+=	libsidplay
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libsidplay

.if ${LIBSIDPLAY_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libsidplay+=	libsidplay>=20060528
BUILDLINK_PKGSRCDIR.libsidplay?=	../../wip/libsidplay2
.endif	# LIBSIDPLAY_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
