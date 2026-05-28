# Copywrite — 카피 작성 도우미

> 한국 카피라이터 작법 기준에 따라 카피를 도출하는 도구
> 미팅룸 내부용 · 박웅현·정철·최인아 등 한국 대표 카피라이터들의 작법 철학 기반

---

## 빠른 시작 (팀원용)

### 1. 일반 사용자 — 브라우저만 있으면 OK

1. **이 페이지로 이동** → https://jungpyo-mtr.github.io/copywrite-tool/
2. 좌측 폼을 채운다 (카피 유형 + 사전 4질문이 핵심)
3. 우측에 자동 생성된 프롬프트가 보임
4. **복사 버튼** 클릭
5. 본인이 쓰는 Claude(웹·Code 무관)에 붙여넣기
6. 결과를 받고 검토

### 2. Claude Code 사용자 — 에이전트 직접 설치 시 더 편함

GUI를 거치지 않고 Claude Code에서 곧바로 호출 가능.

**설치**:
```bash
# 본인 Claude Code 에이전트 폴더로 파일 복사
cp agents/copywrite.md ~/.claude/agents/
# 또는 프로젝트별로 사용 시
cp agents/copywrite.md [project]/.claude/agents/
```

**사용**:
- 작법 분석 문서(`brief.html`)는 에이전트가 자동 참조하지만, 로컬에 있어야 함
- 분석 문서 경로: 에이전트 파일 안 첫머리에 명시되어 있음 (수정 시 본인 경로로)
- 호출: 그냥 평범하게 "카피 짜줘", "슬로건 만들어줘" 하면 자동 invoke

---

## 도구 구성

```
copywrite-tool/
├── index.html           ← GUI 입력 폼 (GitHub Pages 메인 페이지)
├── brief.html           ← 한국 카피라이터 작법 분석 문서 (17섹션)
├── agents/
│   ├── copywrite.md           ← Claude Code 에이전트 본체
│   └── copywrite-refference.md ← 에이전트 제작 기획 문서 (참고용)
└── README.md            ← 이 파일
```

---

## GUI 사용법

### 입력 폼 6개 섹션

| 섹션 | 필수? | 설명 |
|---|---|---|
| 01. 카피 유형 | 필수 | 슬로건/헤드라인/제품/바디/SNS/네이밍 중 택1 |
| 02. 사전 4질문 | 필수 | 본질·타겟·메시지·톤제약. 추상어 자동 감지 |
| 03. 매체 | 조건부 | 캠페인·제품·바디 선택 시만 활성화 |
| 04. 선택 입력 | 선택 | 경쟁사 카피/브랜드 보이스/레퍼런스/금기 |
| 05. 외부 검색 | 선택 | WebSearch 사용 여부 |
| 06. 출력 옵션 | 기본값 OK | 안 개수·다양성 축 |

### 두 가지 출력 모드

오른쪽 상단 토글로 전환:

- **Claude Code 사용자용** — 짧은 프롬프트. 에이전트가 이미 로드되어 있음을 전제.
- **일반 Claude 사용자용** — 작법 원칙·체크리스트가 함께 임베드된 완전한 프롬프트. Claude.ai 웹 등 어디서나 작동.

### 추상어 자동 경고

사전 질문 답변에 "고급/트렌디/특별/혁신/최고/진정성" 등이 들어가면 즉시 경고 표시. 더 구체화하라는 안내.

---

## 결과물 형식

생성된 프롬프트를 Claude에 넣으면 다음 구조의 답변이 돌아옴:

```
# 카피 제안 — [브랜드] [유형]

1. 입력 요약
2. 적용 기준 (어떤 원칙을 우선했나)
3. 도출 과정 (사고 흐름)
4. 최종 안 (3안, 각도 모두 다름)
   - 카피 한 줄
   - 의도
   - 적용 원칙 번호
   - 각도 (시점/시제/어미/구조/레지스터)
   - 12 체크리스트 통과 결과
5. 추천안 + 이유
6. 근거 (작법·음수율·어미·외부자료)
```

모든 안은 **왜 이렇게 나왔는지 추적 가능**한 형태로 제공.

---

## 분석 문서 (brief.html)

GUI에서 우측 상단 "↗ 작법 분석 가이드" 링크로 접근.

17개 섹션 구성:
- **PART 1. 사용법** (5섹션) — 입력 전 사고 정리
- **PART 2. 작동 방식** (4섹션) — 6원칙·12체크리스트·사고 프레임
- **PART 3. 근거** (8섹션) — 한국 카피 분석·인물·언어 특성

PDF로 저장하려면 브라우저에서 Cmd+P → PDF 저장.

---

## 관리자용 — 배포·업데이트 가이드

### 첫 배포 (1회)

```bash
# 1. 이 폴더에서 git 초기화
cd copywrite-tool
git init
git add .
git commit -m "Initial: copywrite tool v1.0"

# 2. GitHub에서 새 레포 생성 (예: copywrite-tool)
# 3. 원격 연결 후 푸시
git remote add origin https://github.com/[username]/copywrite-tool.git
git branch -M main
git push -u origin main

# 4. GitHub > Settings > Pages > Branch: main / 폴더: root
#    → 자동으로 https://[username].github.io/copywrite-tool/ 생성됨
```

### 업데이트

```bash
# 폼이나 브리프 문서 수정 후
git add .
git commit -m "Update: 변경 내용"
git push

# → GitHub Pages가 1~2분 내 자동 반영
```

### 팀에 셰어할 URL

`https://[username].github.io/copywrite-tool/`

이 URL 하나만 팀에 공유하면 됨. 추가 설치·로그인 없이 바로 사용 가능.

---

## 권한·접근 정책

- **Public repo**: URL만 알면 누구나 접근 가능. 외부 노출 OK 시.
- **Private repo + GitHub Pages**: GitHub Pro 이상 필요. 사내 한정 시.

미팅룸 내부용이라면 private 권장. 필요 시 노션 임베드도 가능.

---

## 버전

- v1.0 (2026.05) — 초기 릴리스. 폼 6섹션, 두 출력 모드, 추상어 자동 감지.

---

## 변경·문의

- 작법 기준 변경: `brief.html` 수정
- 에이전트 동작 변경: `agents/copywrite.md` 수정
- GUI 변경: `index.html` 수정
- 문서 변경: 이 `README.md` 수정
