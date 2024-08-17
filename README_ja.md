# BitIndexedTree ライブラリ

このNimライブラリは、**Bit Indexed Tree (Fenwick Tree)** のシンプルな実装を提供します。これは、接頭辞和のクエリとポイント更新を効率的にサポートするデータ構造です。ライブラリは汎用的(ジェネリクスにより)であり、`SomeNumber` に準拠する任意の数値型で動作します。**BitIndexedTree**のデータ構造は配列(array)やシークエンス(seq)と使用法は似せています。

## 概要

Bit Indexed Tree (BIT) は、数値のシーケンスに対する効率的な更新とクエリ操作を可能にするデータ構造です。動的な累積頻度表や累積和に関する問題に一般的に使用されます。

このライブラリの主な特徴は以下の通りです：
- **効率的な更新**: 要素を O(log n) 時間で更新できます。
- **効率的なクエリ**: 接頭辞和を O(log n) 時間で計算できます。
- **汎用型サポート**: 数値演算をサポートする任意の型で動作します。

## インストール

- このライブラリを使用するには、ソースファイルをNimプロジェクトに追加してください。外部依存関係は不要です。
- nimbleでインストールすることもできます。以下のコマンドを使用してください：

```cmd
nimble install https://github.com/nappworks/nbit.git
```

## 使用法

### 初期化

指定された最大サイズでBit Indexed Treeを作成するか、数値のシーケンスから直接作成できます。

```nim
import nbit

# 最大サイズ10の空のBit Indexed Treeを初期化
var bit = genBitIndexedTree[int](10)

# もしくは、数値のシーケンスから初期化
let values = @[1, 2, 3, 4, 5]
var bitFromSeq = toBitIndexedTree(values)
```

### 基本操作

値の更新、接頭辞和のクエリ、配列のような構文を使用して要素にアクセスするなど、さまざまな操作を実行できます。

```nim
# 位置3に値5を追加
bit.add(3, 5)

# 位置3までの接頭辞和をクエリ
let sum = bit.sum(3)
echo sum  # インデックス0から3までの値の和を出力

# 要素に直接アクセス
let valueAtIndex3 = bit[3]
echo valueAtIndex3  # インデックス3の値を出力

# 配列構文を使用して位置2の値を更新
bit[2] = 7

# {}構文を使用してアクセス（位置までの接頭辞和）
let prefixSumAt3 = bit{3}
echo prefixSumAt3  # インデックス3までの接頭辞和を出力
```

## ライセンス

このプロジェクトはMITライセンスです。