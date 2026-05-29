# python-cli-template

基于 [Copier](https://copier.readthedocs.io/) 的 Python CLI 项目脚手架，生成即用的工程化项目模板。

## 特性

- **Typer CLI** — 多级子命令、`-v/-q` 计数模式、`--version/-V`、全局选项
- **pydantic-settings** — TOML 配置管理，`extra='forbid'`，支持环境变量覆盖
- **structlog** — 结构化日志，控制台彩色 + 文件 JSON 轮转
- **ruff** — 代码检查 + 格式化，开箱即用
- **pytest** — 全面的测试套件，覆盖 CLI、配置、装饰器、全局选项
- **[just](https://github.com/casey/just)** — 命令运行器，`just lint` / `just test` / `just ci`
- **可选示例模块** — 自定义模块名，或完全跳过
- **可选文档站点** — Quarto 文档，自动生成 API 参考

## 前置要求

- **[uv](https://docs.astral.sh/uv/getting-started/installation/)** — Python 包管理器
- **[just](https://github.com/casey/just)**（可选） — 命令运行器
- **Python >= 3.12** — uv 会在生成项目时自动下载

## 快速开始

```bash
# 生成项目
uvx copier copy gh:paramount991/python-cli-template path/to/project --trust
cd path/to/project

# 常用命令
just test       # 运行测试
just lint       # 代码检查
just fix        # 自动修复 + 格式化
just run --help # 查看 CLI 帮助
```

## 更新项目

```bash
uvx copier update --trust
```

Copier 会比对 `.copier-answers.yml` 中记录的模板版本，仅更新模板变动的部分。更新后请检查 `pyproject.toml`、`ruff.toml` 是否有冲突。

## 模板变量

| 变量 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `project_name` | str | 无（必填） | 项目名称 |
| `project_slug` | str | 从 project_name 推导 | URL / 目录名 |
| `package_slug` | str | 从 project_slug 推导 | Python 包名 |
| `project_description` | str | `A modular, extensible Python CLI framework` | 项目描述 |
| `project_version` | str | `0.1.0` | 初始版本 |
| `python_version` | str | `3.12` | 最低 Python 版本 |
| `author_name` | str | `Your Name` | 作者 |
| `author_email` | str | `your@email.com` | 作者邮箱 |
| `github_username` | str | `your-username` | GitHub 用户名 |
| `with_docs` | bool | `true` | 是否包含 Quarto 文档 |
| `with_tests` | bool | `true` | 是否包含 pytest 测试 |
| `with_example` | bool | `true` | 是否包含示例模块 |
| `example_name` | str | `demo` | 示例模块名 |

## 项目结构

```
my-project/
├── src/
│   └── my_project/
│       ├── cli/              # CLI 命令层
│       │   ├── commands/     # 子命令（config、version、demo）
│       │   └── callbacks/    # 回调（bootstrap、全局选项）
│       ├── core/             # 核心模块
│       │   └── config/       # 配置管理（settings、database、log...）
│       └── demo/             # 示例业务模块（可选）
├── docs/                     # Quarto 文档（可选）
├── tests/                    # pytest 测试（可选）
├── justfile                  # just 命令运行器
├── pyproject.toml
└── ruff.toml
```

## 开发模板

```bash
git clone https://github.com/paramount991/python-cli-template.git
cd python-cli-template

# 修改模板文件后验证
just test-template
```

## License

MIT
