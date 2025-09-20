#!/bin/bash
# CRM Documentation Generation Script
# 用于生成CRM中文文档的脚本

echo "=== CRM中文文档生成工具 ==="
echo "CRM Chinese Documentation Generator"
echo ""

# Check if R is installed
if command -v R >/dev/null 2>&1; then
    echo "✓ R is installed"
else
    echo "✗ R is not installed. Please install R first."
    echo "  Ubuntu/Debian: sudo apt install r-base"
    echo "  macOS: brew install r"
    echo "  Windows: Download from https://www.r-project.org/"
    exit 1
fi

# Check if pandoc is installed
if command -v pandoc >/dev/null 2>&1; then
    echo "✓ Pandoc is installed"
else
    echo "✗ Pandoc is not installed. Please install pandoc first."
    exit 1
fi

# Check if XeLaTeX is available
if command -v xelatex >/dev/null 2>&1; then
    echo "✓ XeLaTeX is available"
else
    echo "✗ XeLaTeX is not installed. Please install a LaTeX distribution."
    echo "  Ubuntu/Debian: sudo apt install texlive-xetex texlive-lang-chinese"
    echo "  macOS: brew install mactex"
    echo "  Windows: Download MiKTeX or TeXLive"
    exit 1
fi

echo ""
echo "All dependencies are installed. Ready to generate CRM documentation."
echo "所有依赖已安装。准备生成CRM文档。"
echo ""

# List available documents
echo "Available documents (可用文档):"
echo "1. crm-implementation-guide.Rmd - CRM实施指南"
echo "2. crm-chinese-documentation.Rmd - 详细CRM系统文档"
echo ""

# Generate documents
echo "Generating CRM Implementation Guide..."
echo "正在生成CRM实施指南..."
R -e "rmarkdown::render('crm-implementation-guide.Rmd')" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ CRM Implementation Guide generated successfully"
else
    echo "✗ Failed to generate CRM Implementation Guide"
fi

echo ""
echo "Generating detailed CRM documentation..."
echo "正在生成详细CRM系统文档..."
R -e "rmarkdown::render('crm-chinese-documentation.Rmd')" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ Detailed CRM documentation generated successfully"
else
    echo "✗ Failed to generate detailed CRM documentation"
fi

echo ""
echo "Documentation generation completed!"
echo "文档生成完成！"
echo ""
echo "Generated files (生成的文件):"
ls -la *.pdf 2>/dev/null || echo "No PDF files generated. Check for errors above."