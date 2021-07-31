<template>
  <Nuxt />
</template>
<style lang="scss">
.hero {
  h1 {
    font-size: 120px;
  }
  &.__black {
    background: black;
  }
  &.__white {
    h1 {
      color: black !important;
    }
  }
  &.__green {
    background: linear-gradient(
      149.35deg,
      #bbc734 39%,
      rgba(232, 198, 113, 0.85) 87.62%
    );
  }
}
</style>