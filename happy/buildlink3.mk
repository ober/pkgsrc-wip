# $NetBSD: buildlink3.mk,v 1.13 2015/01/07 13:20:55 szptvlfn Exp $

BUILDLINK_TREE+=	happy

.if !defined(HAPPY_BUILDLINK3_MK)
HAPPY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.happy+=	happy>=1.19.5
BUILDLINK_ABI_DEPENDS.happy+=	happy>=1.19.5
BUILDLINK_PKGSRCDIR.happy?=	../../wip/happy

.include "../../devel/hs-mtl/buildlink3.mk"
.endif	# HAPPY_BUILDLINK3_MK

BUILDLINK_TREE+=	-happy
