.class Lcom/google/api/client/json/gson/GsonParser;
.super Lcom/google/api/client/json/JsonParser;
.source "GsonParser.java"


# instance fields
.field private currentNameStack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private currentText:Ljava/lang/String;

.field private currentToken:Lcom/google/api/client/json/JsonToken;

.field private final factory:Lcom/google/api/client/json/gson/GsonFactory;

.field private final reader:Lcom/google/gson/stream/JsonReader;


# direct methods
.method constructor <init>(Lcom/google/api/client/json/gson/GsonFactory;Lcom/google/gson/stream/JsonReader;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    .line 47
    iput-object p1, p0, Lcom/google/api/client/json/gson/GsonParser;->factory:Lcom/google/api/client/json/gson/GsonFactory;

    .line 48
    iput-object p2, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    const/4 p1, 0x1

    .line 50
    invoke-virtual {p2, p1}, Lcom/google/gson/stream/JsonReader;->setLenient(Z)V

    return-void
.end method

.method private checkNumber()V
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    sget-object v1, Lcom/google/api/client/json/JsonToken;->VALUE_NUMBER_INT:Lcom/google/api/client/json/JsonToken;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    sget-object v1, Lcom/google/api/client/json/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/google/api/client/json/JsonToken;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->close()V

    return-void
.end method

.method public getBigIntegerValue()Ljava/math/BigInteger;
    .locals 2

    .line 100
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 101
    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getByteValue()B
    .locals 1

    .line 75
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 76
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v0

    return v0
.end method

.method public getCurrentName()Ljava/lang/String;
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getCurrentToken()Lcom/google/api/client/json/JsonToken;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    return-object v0
.end method

.method public getDecimalValue()Ljava/math/BigDecimal;
    .locals 2

    .line 106
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 107
    new-instance v0, Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getDoubleValue()D
    .locals 2

    .line 112
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 113
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFactory()Lcom/google/api/client/json/JsonFactory;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->factory:Lcom/google/api/client/json/gson/GsonFactory;

    return-object v0
.end method

.method public getFloatValue()F
    .locals 1

    .line 94
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 95
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getIntValue()I
    .locals 1

    .line 88
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 89
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getLongValue()J
    .locals 2

    .line 118
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 119
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShortValue()S
    .locals 1

    .line 81
    invoke-direct {p0}, Lcom/google/api/client/json/gson/GsonParser;->checkNumber()V

    .line 82
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S

    move-result v0

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    return-object v0
.end method

.method public nextToken()Lcom/google/api/client/json/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 135
    sget-object v0, Lcom/google/api/client/json/gson/GsonParser$1;->$SwitchMap$com$google$api$client$json$JsonToken:[I

    iget-object v2, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    invoke-virtual {v2}, Lcom/google/api/client/json/JsonToken;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 141
    :pswitch_0
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->beginObject()V

    .line 142
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 137
    :pswitch_1
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->beginArray()V

    .line 138
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    :cond_0
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 154
    :catch_0
    sget-object v0, Lcom/google/gson/stream/JsonToken;->END_DOCUMENT:Lcom/google/gson/stream/JsonToken;

    .line 156
    :goto_1
    sget-object v2, Lcom/google/api/client/json/gson/GsonParser$1;->$SwitchMap$com$google$gson$stream$JsonToken:[I

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonToken;->ordinal()I

    move-result v0

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_1

    .line 206
    iput-object v1, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 207
    iput-object v1, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto/16 :goto_3

    .line 201
    :pswitch_2
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 202
    sget-object v0, Lcom/google/api/client/json/JsonToken;->FIELD_NAME:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    .line 203
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iget-object v2, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3

    .line 196
    :pswitch_3
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 197
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_NUMBER_INT:Lcom/google/api/client/json/JsonToken;

    goto :goto_2

    :cond_1
    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/google/api/client/json/JsonToken;

    :goto_2
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto/16 :goto_3

    .line 192
    :pswitch_4
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 193
    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_STRING:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto :goto_3

    :pswitch_5
    const-string v0, "null"

    .line 187
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 188
    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_NULL:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    .line 189
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->nextNull()V

    goto :goto_3

    .line 178
    :pswitch_6
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->nextBoolean()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "true"

    .line 179
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 180
    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_TRUE:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto :goto_3

    :cond_2
    const-string v0, "false"

    .line 182
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 183
    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_FALSE:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto :goto_3

    :pswitch_7
    const-string v0, "}"

    .line 172
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 173
    sget-object v0, Lcom/google/api/client/json/JsonToken;->END_OBJECT:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    .line 174
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 175
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->endObject()V

    goto :goto_3

    :pswitch_8
    const-string v0, "{"

    .line 168
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 169
    sget-object v0, Lcom/google/api/client/json/JsonToken;->START_OBJECT:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto :goto_3

    :pswitch_9
    const-string v0, "]"

    .line 162
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 163
    sget-object v0, Lcom/google/api/client/json/JsonToken;->END_ARRAY:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    .line 164
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentNameStack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 165
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->endArray()V

    goto :goto_3

    :pswitch_a
    const-string v0, "["

    .line 158
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 159
    sget-object v0, Lcom/google/api/client/json/JsonToken;->START_ARRAY:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    .line 209
    :goto_3
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public skipChildren()Lcom/google/api/client/json/JsonParser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 214
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    if-eqz v0, :cond_0

    .line 215
    sget-object v0, Lcom/google/api/client/json/gson/GsonParser$1;->$SwitchMap$com$google$api$client$json$JsonToken:[I

    iget-object v1, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    invoke-virtual {v1}, Lcom/google/api/client/json/JsonToken;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 222
    :pswitch_0
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->skipValue()V

    const-string v0, "}"

    .line 223
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 224
    sget-object v0, Lcom/google/api/client/json/JsonToken;->END_OBJECT:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    goto :goto_0

    .line 217
    :pswitch_1
    iget-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->reader:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v0}, Lcom/google/gson/stream/JsonReader;->skipValue()V

    const-string v0, "]"

    .line 218
    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentText:Ljava/lang/String;

    .line 219
    sget-object v0, Lcom/google/api/client/json/JsonToken;->END_ARRAY:Lcom/google/api/client/json/JsonToken;

    iput-object v0, p0, Lcom/google/api/client/json/gson/GsonParser;->currentToken:Lcom/google/api/client/json/JsonToken;

    :cond_0
    :goto_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
