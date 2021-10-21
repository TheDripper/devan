<template>
  <div id="root" class="flex">
    <div :class="classes"></div>
    <div id="content" v-html="page.content.rendered" class=""></div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import $ from "jquery";
export default {
  methods: {
    ...mapActions(["getPage"]),
  },
  async asyncData({ $axios, route }) {
    try {
      // let data = await getPage(6);
      let id = route.params.page;
      const page = await $axios.$get("/api/pages/" + id);
      return {
        page,
      };
    } catch (err) {
      console.log(err);
    }
  },
  created() {},
  mounted() {
    // $("a").each(function () {
    //   $(this).attr("target", "_blank");
    // });
    $(".scroll a").on("click", function (e) {
      e.preventDefault();
      const hash = $(this).attr("href");
      console.log(hash);
      // const headerHeight = $header.outerHeight() + 500;
      const offset = $(hash).offset().top;
      $("html,body").animate({ scrollTop: offset }, 500);
    });
    let instance = this;
    $(".slider").each(function () {
      instance.$slider($(this).find(".blocks-gallery-grid"));
    });
  },
  computed: {
    // page() {
    //   return this.$store.state.posts[0];
    // },
    classes() {
      return this.$store.state.classes;
    },
  },
};
</script>
<style lang="scss">
#content {
  overflow-x: hidden;
  width: 100vw;
}
html,
body {
}
h1,
h2,
h3,
h4,
h5,
h6 {
  @apply font-head leading-snug;
}
h1 {
  @apply text-6xl font-bold;
}
h2 {
  @apply text-4xl font-bold;
}
h3 {
  @apply text-3xl font-bold;
}
h4 {
  @apply mb-2;
}
p,
a,
li {
  @apply font-body font-light text-lg;
}
ul {
  list-style: circle;
  @apply pl-4;
}
.blocks-gallery-grid.slick-slider {
  @apply w-full relative pt-12 mt-12;
  height: 230px;
  overflow: hidden;
  figure {
    height: 230px;
    overflow: hidden;
    @apply flex justify-center items-center;
  }
  .slick-prev {
    @apply absolute rounded p-2;
    top: 0;
    left: 0;
    color: white;
  }
  .slick-next {
    @apply absolute rounded p-2;
    top: 0;
    right: 0;
    color: white;
  }
}
.gallery-vertical {
  li {
    margin: 3rem 0 !important;
    img {
      max-width: 120px !important;
      @apply mx-auto;
    }
  }
}
.w-full-gutter {
  width: calc(100% - 2rem);
}
.wp-block-button__link {
  border-radius: 0;
  background: none;
  border: 2px solid black;
  color: black;
  @apply font-footer;
}
.wp-block-buttons {
  @apply mt-8;
}
.bleed-up {
  img {
    transform: translateY(-30px);
    @apply relative z-10;
  }
}
.epmt {
  @apply flex justify-end;
  img {
    max-width: 913px;
    transform: translate(257px);
  }
}
.arrow-link {
  a {
    color: #b8c734;
    @apply relative font-normal mt-12 inline-block;
    &:after {
      @apply absolute;
      top: 50%;
      right: 0;
      transform: translate(110%, -38%);
      content: url("/Arrow.svg");
    }
  }
}
.list-none {
  ul {
    list-style: none !important;
  }
}
.wp-block-image {
  img {
    height: auto;
  }
}
.has-white-background {
  .font-hero {
    color: black;
  }
}
.blog-preview {
  h2 {
    @apply text-blog-head;
  }
  p {
    @apply text-3xl;
  }
  &.__right {
    .wp-block-column {
      transform: translate(100px);
    }
  }
  &.__left {
    .wp-block-column {
      transform: translate(-100px);
    }
  }
}
.testimonial {
  @apply relative;
  h2 {
    color: black !important;
    @apply absolute top-0;
    left: calc(50% + 1.5rem);
    font-size: 64px;
    transform: translateY(-50%);
  }
  h4 {
    color: black !important;
    @apply text-2xl font-body absolute;
    right: 10rem;
    bottom: 12rem;
  }
  p {
    color: black !important;
  }
  img {
    width: auto !important;
    height: auto !important;
    margin: 0 auto !important;
  }
}
.text-block {
  h2 {
    color: black !important;
    font-size: 64px;
  }
  p {
    color: black !important;
  }
  &.__black {
    h2 {
    color: white !important;
    }
  }
}
</style>