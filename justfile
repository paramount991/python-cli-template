# justfile — Python CLI Template 开发
# https://github.com/casey/just

default: test-template

# 验证模板生成 (生成测试项目 + ruff + pytest)
test-template:
    @rm -rf /tmp/copier-verify
    @uv tool run copier copy --trust \
        -d project_name="Test App" \
        -d project_slug="test-app" \
        -d package_slug="test_app" \
        -d project_description="A test app" \
        -d project_version="0.1.0" \
        -d python_version="3.12" \
        -d author_name="Test User" \
        -d author_email="test@example.com" \
        -d github_username="testuser" \
        -d with_docs="true" \
        -d with_tests="true" \
        -d with_example="true" \
        -d example_name="demo" \
        . /tmp/copier-verify
    cd /tmp/copier-verify && uv run ruff check . && uv run pytest -v

# 仅检查模板生成 (不跑测试)
check-generate:
    @rm -rf /tmp/copier-verify
    @uv tool run copier copy --trust \
        -d project_name="Test App" \
        -d project_slug="test-app" \
        -d package_slug="test_app" \
        -d project_description="A test app" \
        -d project_version="0.1.0" \
        -d python_version="3.12" \
        -d author_name="Test User" \
        -d author_email="test@example.com" \
        -d github_username="testuser" \
        -d with_docs="true" \
        -d with_tests="true" \
        -d with_example="true" \
        -d example_name="demo" \
        . /tmp/copier-verify
    cd /tmp/copier-verify && uv run ruff check .

# 测试项目功能
test-features: test-template
    cd /tmp/copier-verify && uv run test-app --version && uv run test-app --help
