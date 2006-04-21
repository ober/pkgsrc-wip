# $NetBSD: buildlink3.mk,v 1.1.1.1 2006/04/21 04:20:15 jeremy-c-reed Exp $

BUILDLINK_DEPMETHOD.evieext?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EVIEEXT_BUILDLINK3_MK:=	${EVIEEXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	evieext
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nevieext}
BUILDLINK_PACKAGES+=	evieext

.if !empty(EVIEEXT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.evieext+=	evieext>=1.0.2
BUILDLINK_PKGSRCDIR.evieext?=	../../wip/evieext
.endif	# EVIEEXT_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
