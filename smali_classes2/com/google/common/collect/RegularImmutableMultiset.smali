.class Lcom/google/common/collect/RegularImmutableMultiset;
.super Lcom/google/common/collect/ImmutableMultiset;
.source "RegularImmutableMultiset.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    serializable = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/RegularImmutableMultiset$ElementSet;,
        Lcom/google/common/collect/RegularImmutableMultiset$NonTerminalEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableMultiset<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final EMPTY:Lcom/google/common/collect/RegularImmutableMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/RegularImmutableMultiset<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private transient elementSet:Lcom/google/common/collect/ImmutableSet;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final transient entries:[Lcom/google/common/collect/Multisets$ImmutableEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/Multisets$ImmutableEntry<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final transient hashCode:I

.field private final transient hashTable:[Lcom/google/common/collect/Multisets$ImmutableEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/Multisets$ImmutableEntry<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final transient size:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 37
    new-instance v0, Lcom/google/common/collect/RegularImmutableMultiset;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/common/collect/RegularImmutableMultiset;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/google/common/collect/RegularImmutableMultiset;->EMPTY:Lcom/google/common/collect/RegularImmutableMultiset;

    return-void
.end method

.method constructor <init>(Ljava/util/Collection;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/google/common/collect/Multiset$Entry<",
            "+TE;>;>;)V"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMultiset;-><init>()V

    .line 49
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    .line 51
    new-array v1, v0, [Lcom/google/common/collect/Multisets$ImmutableEntry;

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 53
    iput-object v1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->entries:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->hashTable:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    .line 55
    iput v2, p0, Lcom/google/common/collect/RegularImmutableMultiset;->size:I

    .line 56
    iput v2, p0, Lcom/google/common/collect/RegularImmutableMultiset;->hashCode:I

    .line 57
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->elementSet:Lcom/google/common/collect/ImmutableSet;

    goto/16 :goto_3

    :cond_0
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 59
    invoke-static {v0, v3, v4}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result v0

    add-int/lit8 v3, v0, -0x1

    .line 62
    new-array v0, v0, [Lcom/google/common/collect/Multisets$ImmutableEntry;

    const-wide/16 v4, 0x0

    .line 67
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v6, v2

    move v7, v6

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/common/collect/Multiset$Entry;

    .line 68
    invoke-interface {v8}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 69
    invoke-interface {v8}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v10

    .line 70
    invoke-virtual {v9}, Ljava/lang/Object;->hashCode()I

    move-result v11

    .line 71
    invoke-static {v11}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v12

    and-int/2addr v12, v3

    .line 72
    aget-object v13, v0, v12

    if-nez v13, :cond_3

    .line 75
    instance-of v13, v8, Lcom/google/common/collect/Multisets$ImmutableEntry;

    if-eqz v13, :cond_1

    instance-of v13, v8, Lcom/google/common/collect/RegularImmutableMultiset$NonTerminalEntry;

    if-nez v13, :cond_1

    const/4 v13, 0x1

    goto :goto_1

    :cond_1
    move v13, v2

    :goto_1
    if-eqz v13, :cond_2

    .line 77
    check-cast v8, Lcom/google/common/collect/Multisets$ImmutableEntry;

    goto :goto_2

    :cond_2
    new-instance v8, Lcom/google/common/collect/Multisets$ImmutableEntry;

    invoke-direct {v8, v9, v10}, Lcom/google/common/collect/Multisets$ImmutableEntry;-><init>(Ljava/lang/Object;I)V

    goto :goto_2

    .line 82
    :cond_3
    new-instance v8, Lcom/google/common/collect/RegularImmutableMultiset$NonTerminalEntry;

    invoke-direct {v8, v9, v10, v13}, Lcom/google/common/collect/RegularImmutableMultiset$NonTerminalEntry;-><init>(Ljava/lang/Object;ILcom/google/common/collect/Multisets$ImmutableEntry;)V

    :goto_2
    xor-int v9, v11, v10

    add-int/2addr v6, v9

    add-int/lit8 v9, v7, 0x1

    .line 85
    aput-object v8, v1, v7

    .line 86
    aput-object v8, v0, v12

    int-to-long v7, v10

    add-long/2addr v4, v7

    move v7, v9

    goto :goto_0

    .line 89
    :cond_4
    iput-object v1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->entries:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    .line 90
    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->hashTable:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    .line 91
    invoke-static {v4, v5}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->size:I

    .line 92
    iput v6, p0, Lcom/google/common/collect/RegularImmutableMultiset;->hashCode:I

    :goto_3
    return-void
.end method

.method static synthetic access$100(Lcom/google/common/collect/RegularImmutableMultiset;)[Lcom/google/common/collect/Multisets$ImmutableEntry;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->entries:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    return-object p0
.end method


# virtual methods
.method public count(Ljava/lang/Object;)I
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 117
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->hashTable:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    const/4 v1, 0x0

    if-eqz p1, :cond_3

    if-nez v0, :cond_0

    goto :goto_1

    .line 121
    :cond_0
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v2

    .line 122
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    .line 123
    aget-object v0, v0, v2

    :goto_0
    if-eqz v0, :cond_2

    .line 126
    invoke-virtual {v0}, Lcom/google/common/collect/Multisets$ImmutableEntry;->getElement()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 127
    invoke-virtual {v0}, Lcom/google/common/collect/Multisets$ImmutableEntry;->getCount()I

    move-result p1

    return p1

    .line 125
    :cond_1
    invoke-virtual {v0}, Lcom/google/common/collect/Multisets$ImmutableEntry;->nextInBucket()Lcom/google/common/collect/Multisets$ImmutableEntry;

    move-result-object v0

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_1
    return v1
.end method

.method public elementSet()Lcom/google/common/collect/ImmutableSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet<",
            "TE;>;"
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->elementSet:Lcom/google/common/collect/ImmutableSet;

    if-nez v0, :cond_0

    .line 141
    new-instance v0, Lcom/google/common/collect/RegularImmutableMultiset$ElementSet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/RegularImmutableMultiset$ElementSet;-><init>(Lcom/google/common/collect/RegularImmutableMultiset;Lcom/google/common/collect/RegularImmutableMultiset$1;)V

    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->elementSet:Lcom/google/common/collect/ImmutableSet;

    :cond_0
    return-object v0
.end method

.method public bridge synthetic elementSet()Ljava/util/Set;
    .locals 1

    .line 34
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableMultiset;->elementSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method getEntry(I)Lcom/google/common/collect/Multiset$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 170
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->entries:[Lcom/google/common/collect/Multisets$ImmutableEntry;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public hashCode()I
    .locals 1

    .line 175
    iget v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->hashCode:I

    return v0
.end method

.method isPartialView()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public size()I
    .locals 1

    .line 135
    iget v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->size:I

    return v0
.end method
