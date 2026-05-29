#!/bin/bash
# Copywrite Tool — 배포 스크립트
# 사용: .claude/agents/ 안에서 ./deploy.sh 실행

set -e
cd "$(dirname "$0")"

if [[ -z $(git status -s) ]]; then
  echo "✓ 변경사항 없음. 종료."
  exit 0
fi

echo "▶ 변경사항 확인:"
git status --short
echo ""

# 커밋 메시지: 인자로 받거나 자동 생성
if [[ -n "$1" ]]; then
  MSG="$1"
else
  MSG="Deploy: $(date +'%Y-%m-%d %H:%M')"
fi

git add -A
git commit -m "$MSG"
git push

echo ""
echo "✓ 배포 완료"
echo "  팀 URL: https://jungpyo-mtr.github.io/copywrite-tool/"
echo "  (GitHub Pages 반영까지 1~2분 소요)"
