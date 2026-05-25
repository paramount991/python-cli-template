# python-cli-template

基于 [Copier](https://copier.readthedocs.io/) 的 Python CLI 项目脚手架，生成即用的工程化项目模板。

## 特性

- **Typer CLI** — 多级子命令、全局选项、自动 help
- **pydantic-settings** — TOML 配置管理，支持环境变量覆盖
- **structlog** — 结构化日志，控制台彩色 + 文件 JSON 轮转
- **ruff** — 代码检查，开箱即用
- **pytest** — 67 个测试用例，覆盖配置、装饰器、全局选项
- **可选示例模块** — 自定义模块名，或完全跳过
- **可选文档站点** — Quarto 文档，自动生成 API 参考

## 快速开始

```bash
uvx copier copy gh:paramount991/python-cli-template my-project --trust
```

Copier 会交互式询问项目名、包名等配置，确认后自动执行 `uv sync` + `ruff check`，进入目录即可开始开发。

## 模板变量

| 变量 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `project_name` | str | `_folder_name` | 项目名称 |
| `project_slug` | str | 从 project_name 推导 | URL / 目录名 |
| `package_slug` | str | 从 project_slug 推导 | Python 包名 |
| `project_description` | str | `A modular, extensible Python CLI framework` | 项目描述 |
| `project_version` | str | `0.1.0` | 初始版本 |
| `python_version` | str | `3.12` | 最低 Python 版本 (3.10/3.11/3.12) |
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
│       │   ├── commands/     # 子命令
│       │   └── callbacks/    # 回调（bootstrap、全局选项）
│       ├── core/             # 核心模块
│       │   └── config/       # 配置管理
│       └── demo/             # 示例业务模块（可选）
├── docs/                     # Quarto 文档（可选）
├── tests/                    # pytest 测试（可选）
├── pyproject.toml
└── ruff.toml
```

## 开发模板

```bash
git clone gh:paramount991/python-cli-template
cd python-cli-template

# 修改模板文件后验证
uvx copier copy . ../test-output --trust --defaults --data "with_example=false"
```

## License

MIT
