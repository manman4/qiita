---
title: PuLPで連立一次方程式を解く
tags:
  - pulp
private: false
updated_at: '2023-08-20T02:49:16+09:00'
id: ed51ddea644f5f3748d2
organization_url_name: null
slide: false
---
# PuLPで連立一次方程式を解く

## 前提

あらかじめpulpをインストールしておく。

## 問題1

    2x + 3y = 8

    4x + 5y = 14

## pulpで解く
  
  ```python
  import pulp

  # 問題の宣言
  problem = pulp.LpProblem('test', pulp.LpMinimize)

  # 変数の宣言
  x = pulp.LpVariable('x', lowBound=0)
  y = pulp.LpVariable('y', lowBound=0)

  # 制約条件の宣言
  problem += 2 * x + 3 * y == 8
  problem += 4 * x + 5 * y == 14

  # 解く
  status = problem.solve()

  # 結果の表示
  print(pulp.LpStatus[status])
  print(x.value(), y.value())
  ```

## 結果1

  ```
  Optimal
  1.0 2.0
  ```
  確かに解けました。

## 問題2

    2x + 3y = 8

    2x + 3y = 14

## pulpで解く
  
  ```python
  import pulp

  # 問題の宣言
  problem = pulp.LpProblem('test', pulp.LpMinimize)

  # 変数の宣言
  x = pulp.LpVariable('x', lowBound=0)
  y = pulp.LpVariable('y', lowBound=0)

  # 制約条件の宣言
  problem += 2 * x + 3 * y == 8
  problem += 2 * x + 3 * y == 14

  # 解く
  status = problem.solve()

  # 結果の表示
  print(pulp.LpStatus[status])
  print(x.value(), y.value())
  ```

## 結果2

  ```
  Infeasible
  7.0 0.0
  ```
  答えがあるように見えますが、statusがInfeasibleになっています。これは、制約条件が矛盾していることを示しています。
