# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### 修复

- 在用户列表中展示🍠红薯的消耗总数量

---

## [1.4.2] - 2023-10-28

### 修复

- `v1.4.1`中提供的解决方案在生产环境未生效的问题 

---

## [1.4.1] - 2023-10-28

### 修复

- 修改食物数量时，没有实时更新的问题

---

## [1.4.0] - 2023-10-27

### 新增

- 多端实时同步最新烹饪状态
- 将页面添加至 iOS 首页时，展示正确的图标

### 修复

- 部分文本在深色模式下不可见的问题

---

## [1.3.0] - 2023-10-25

### 新增

- [Changelog](/changelog)

---

## [1.2.1] - 2023-10-24

### 更改

- 调整红薯单位为「份」

---

## [1.2.0] - 2023-10-23

### 新增

- [访客统计](/analytics)

### 更改

- 降低 Sentry 数据上报速率

---

## [1.1.0] - 2023-10-22

### 新增

- 新产品：🍠红薯

### 更改

- 烹饪历史记录中只包含至少吃了一种食物的用户
- 所有产品的数量展示共享一个 WebSocket 连接（原：每个产品一个连接）

## 移除

- 开发期间的 Sentry 错误上报机制

---

## [1.0.0] - 2023-10-20

### 新增

- 当日烹饪食材数量展示大屏
  - 记录每日「🥚鸡蛋」和「🌽玉米」的总需求量
- 记录烹饪 & 烹饪历史数据
  - 通过「开始烹饪」和「结束烹饪」机制
- 产品列表
- 统计 & 营收数据
- 用户列表 & 用户添加功能
  - 记录和修改每个用户的「🥚鸡蛋」和「🥚玉米」的需求量

[unreleased]: https://github.com/muxinqi/breakfast_tracker/compare/v1.4.2...HEAD
[1.4.2]: https://github.com/muxinqi/breakfast_tracker/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/muxinqi/breakfast_tracker/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/muxinqi/breakfast_tracker/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/muxinqi/breakfast_tracker/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/muxinqi/breakfast_tracker/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/muxinqi/breakfast_tracker/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/muxinqi/breakfast_tracker/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/muxinqi/breakfast_tracker/releases/tag/v1.0.0
