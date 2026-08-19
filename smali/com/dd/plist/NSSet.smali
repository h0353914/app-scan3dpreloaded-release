.class public Lcom/dd/plist/NSSet;
.super Lcom/dd/plist/NSObject;
.source "NSSet.java"


# instance fields
.field private ordered:Z

.field private set:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/dd/plist/NSObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/dd/plist/NSSet;->ordered:Z

    .line 49
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 59
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/dd/plist/NSSet;->ordered:Z

    .line 60
    iput-boolean p1, p0, Lcom/dd/plist/NSSet;->ordered:Z

    if-nez p1, :cond_0

    .line 62
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    goto :goto_0

    .line 64
    :cond_0
    new-instance p1, Ljava/util/TreeSet;

    invoke-direct {p1}, Ljava/util/TreeSet;-><init>()V

    iput-object p1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    :goto_0
    return-void
.end method

.method public varargs constructor <init>(Z[Lcom/dd/plist/NSObject;)V
    .locals 1

    .line 86
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/dd/plist/NSSet;->ordered:Z

    .line 87
    iput-boolean p1, p0, Lcom/dd/plist/NSSet;->ordered:Z

    if-nez p1, :cond_0

    .line 89
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    goto :goto_0

    .line 91
    :cond_0
    new-instance p1, Ljava/util/TreeSet;

    invoke-direct {p1}, Ljava/util/TreeSet;-><init>()V

    iput-object p1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    .line 92
    :goto_0
    iget-object p1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public varargs constructor <init>([Lcom/dd/plist/NSObject;)V
    .locals 1

    .line 73
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/dd/plist/NSSet;->ordered:Z

    .line 74
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    .line 75
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method public declared-synchronized addObject(Lcom/dd/plist/NSObject;)V
    .locals 1

    monitor-enter p0

    .line 101
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized allObjects()[Lcom/dd/plist/NSObject;
    .locals 2

    monitor-enter p0

    .line 119
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-virtual {p0}, Lcom/dd/plist/NSSet;->count()I

    move-result v1

    new-array v1, v1, [Lcom/dd/plist/NSObject;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dd/plist/NSObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized anyObject()Lcom/dd/plist/NSObject;
    .locals 1

    monitor-enter p0

    .line 129
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 130
    monitor-exit p0

    return-object v0

    .line 132
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dd/plist/NSObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 2

    .line 259
    invoke-super {p0, p1}, Lcom/dd/plist/NSObject;->assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V

    .line 260
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dd/plist/NSObject;

    .line 261
    invoke-virtual {v1, p1}, Lcom/dd/plist/NSObject;->assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public containsObject(Lcom/dd/plist/NSObject;)Z
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public declared-synchronized count()I
    .locals 1

    monitor-enter p0

    .line 233
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 219
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    return v0

    .line 222
    :cond_1
    check-cast p1, Lcom/dd/plist/NSSet;

    .line 223
    iget-object v1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    iget-object p1, p1, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    if-eq v1, p1, :cond_2

    if-eqz v1, :cond_3

    invoke-interface {v1, p1}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const/4 v0, 0x1

    :cond_3
    return v0
.end method

.method getSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/dd/plist/NSObject;",
            ">;"
        }
    .end annotation

    .line 204
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 210
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Set;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xcb

    add-int/2addr v1, v0

    return v1
.end method

.method public declared-synchronized intersectsSet(Lcom/dd/plist/NSSet;)Z
    .locals 2

    monitor-enter p0

    .line 167
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dd/plist/NSObject;

    .line 168
    invoke-virtual {p1, v1}, Lcom/dd/plist/NSSet;->containsObject(Lcom/dd/plist/NSObject;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    .line 169
    monitor-exit p0

    return p1

    :cond_1
    const/4 p1, 0x0

    .line 171
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized isSubsetOfSet(Lcom/dd/plist/NSSet;)Z
    .locals 2

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dd/plist/NSObject;

    .line 182
    invoke-virtual {p1, v1}, Lcom/dd/plist/NSSet;->containsObject(Lcom/dd/plist/NSObject;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    const/4 p1, 0x0

    .line 183
    monitor-exit p0

    return p1

    :cond_1
    const/4 p1, 0x1

    .line 185
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized member(Lcom/dd/plist/NSObject;)Lcom/dd/plist/NSObject;
    .locals 3

    monitor-enter p0

    .line 153
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dd/plist/NSObject;

    .line 154
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 155
    monitor-exit p0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    .line 157
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized objectIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/dd/plist/NSObject;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 196
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeObject(Lcom/dd/plist/NSObject;)V
    .locals 1

    monitor-enter p0

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected toASCII(Ljava/lang/StringBuilder;I)V
    .locals 6

    .line 287
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSSet;->indent(Ljava/lang/StringBuilder;I)V

    .line 288
    invoke-virtual {p0}, Lcom/dd/plist/NSSet;->allObjects()[Lcom/dd/plist/NSObject;

    move-result-object v0

    const/16 v1, 0x28

    .line 289
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 290
    sget-object v1, Lcom/dd/plist/NSSet;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    move v3, v1

    move v1, v2

    .line 291
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_5

    .line 292
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 293
    const-class v5, Lcom/dd/plist/NSDictionary;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-class v5, Lcom/dd/plist/NSArray;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-class v5, Lcom/dd/plist/NSData;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 294
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 295
    sget-object v3, Lcom/dd/plist/NSSet;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    .line 297
    aget-object v4, v0, v1

    add-int/lit8 v5, p2, 0x1

    invoke-virtual {v4, p1, v5}, Lcom/dd/plist/NSObject;->toASCII(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    const-string v4, " "

    .line 300
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    :cond_2
    aget-object v4, v0, v1

    invoke-virtual {v4, p1, v2}, Lcom/dd/plist/NSObject;->toASCII(Ljava/lang/StringBuilder;I)V

    .line 304
    :goto_1
    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    if-eq v1, v4, :cond_3

    const/16 v4, 0x2c

    .line 305
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    :cond_3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v4, v3

    const/16 v5, 0x50

    if-le v4, v5, :cond_4

    .line 308
    sget-object v3, Lcom/dd/plist/NSSet;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    const/16 p2, 0x29

    .line 312
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method protected toASCIIGnuStep(Ljava/lang/StringBuilder;I)V
    .locals 6

    .line 325
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSSet;->indent(Ljava/lang/StringBuilder;I)V

    .line 326
    invoke-virtual {p0}, Lcom/dd/plist/NSSet;->allObjects()[Lcom/dd/plist/NSObject;

    move-result-object v0

    const/16 v1, 0x28

    .line 327
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 328
    sget-object v1, Lcom/dd/plist/NSSet;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    move v3, v1

    move v1, v2

    .line 329
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_5

    .line 330
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 331
    const-class v5, Lcom/dd/plist/NSDictionary;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-class v5, Lcom/dd/plist/NSArray;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-class v5, Lcom/dd/plist/NSData;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 332
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 333
    sget-object v3, Lcom/dd/plist/NSSet;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    .line 335
    aget-object v4, v0, v1

    add-int/lit8 v5, p2, 0x1

    invoke-virtual {v4, p1, v5}, Lcom/dd/plist/NSObject;->toASCIIGnuStep(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    const-string v4, " "

    .line 338
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    :cond_2
    aget-object v4, v0, v1

    invoke-virtual {v4, p1, v2}, Lcom/dd/plist/NSObject;->toASCIIGnuStep(Ljava/lang/StringBuilder;I)V

    .line 342
    :goto_1
    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    if-eq v1, v4, :cond_3

    const/16 v4, 0x2c

    .line 343
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    :cond_3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v4, v3

    const/16 v5, 0x50

    if-le v4, v5, :cond_4

    .line 346
    sget-object v3, Lcom/dd/plist/NSSet;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    const/16 p2, 0x29

    .line 350
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    iget-boolean v0, p0, Lcom/dd/plist/NSSet;->ordered:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xb

    .line 268
    iget-object v1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeIntHeader(II)V

    goto :goto_0

    :cond_0
    const/16 v0, 0xc

    .line 270
    iget-object v1, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeIntHeader(II)V

    .line 272
    :goto_0
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dd/plist/NSObject;

    .line 273
    invoke-virtual {p1, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->getID(Lcom/dd/plist/NSObject;)I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeID(I)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method toXML(Ljava/lang/StringBuilder;I)V
    .locals 3

    .line 246
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSSet;->indent(Ljava/lang/StringBuilder;I)V

    const-string v0, "<array>"

    .line 247
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    sget-object v0, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    iget-object v0, p0, Lcom/dd/plist/NSSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dd/plist/NSObject;

    add-int/lit8 v2, p2, 0x1

    .line 250
    invoke-virtual {v1, p1, v2}, Lcom/dd/plist/NSObject;->toXML(Ljava/lang/StringBuilder;I)V

    .line 251
    sget-object v1, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 253
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSSet;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "</array>"

    .line 254
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
