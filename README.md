# Typst 이력서

<a href="[https://github.com/partrita/typst-resume/releases](https://github.com/partrita/typst-resume/releases)">
<img src="[https://img.shields.io/github/v/release/partrita/typst-resume](https://img.shields.io/github/v/release/partrita/typst-resume)"/>
</a>


이곳에서 [Typst](https://typst.app)를 통해 데이터 기반의 지속적으로 배포되는 이력서를 호스팅하고  있습니다!

![](./latest.png)</p>

# ✨ 작동 방식

이 섹션에서는 제 이력서 생성 및 유지 관리의 워크플로우와 기술을 설명합니다.

  - **자동 업데이트:** 태그된 업데이트가 있을 때마다 소스 파일이 컴파일되어 [사용자 지정 작성 GitHub 액션](https://github.com/ammar-ahmed22/compile-typst-action)과 함께 릴리스됩니다.
  - **데이터 기반 이력서:** [Typst](https://typst.app)의 기능 덕분에 모든 이력서 데이터는 `.yml` 파일에 저장됩니다. Typst는 이 데이터를 읽고 파싱하여 이력서를 렌더링하는 데 사용된 사용자 지정 함수를 정의할 수 있습니다!
  - **버전 관리:** 모든 태그와 릴리스는 의미론적으로 버전이 관리됩니다. 또한 사용자 지정 post-commit 훅을 작성하여 커밋에 태그를 지정할 것인지 묻도록 설정했습니다. 이 git 훅은 최신 태그와 이것이 주요 변경사항인지, 사소한 변경사항인지, 또는 패치 변경사항인지에 따라 자동으로 버전을 업데이트합니다!

다음은 제가 커밋을 할 때의 모습입니다:

```bash
>> git add . && git commit -m "Some changes"
[post-commit hook] Commit done!
Would you like to tag this commit? [y/N] y
[current-version]: v1.7
Is this a major change or a minor change? minor
[bumping-version]: v1.8
[main 0d0fce2] Some changes
 2 files changed, 30 insertions(+), 4 deletions(-)
```

  - **테스트:** `NodeJS` 팬으로서, 이 레포에 `package.json`을 설정하여 `yarn` 명령을 실행하여 이력서를 로컬에서 컴파일할 수 있도록 했습니다.


# 🔗 저와 연결하기
