<template>
    <div>
        <template v-if="enableVisualizer">
            <div class="backgroundElement" type="visualizer">
                <template v-if="visualizerComponent">
                    <visualizer ref="vis" v-model="visualizer"/>
                </template>
            </div>
            <div class="visualizerControls container">
                <b-row row="auto">
                    <b-col>
                        <div class="form form-horizontal">
                        <template v-if="volume > 0.5">
                            <b-icon icon="volume-up-fill" id="volumeIcon"/>
                        </template>
                        <template v-else-if="volume < 0.5 && volume > 0.001">
                            <b-icon icon="volume-down-fill" id="volumeIcon"/>
                        </template>
                        <template v-else>
                            <b-icon icon="volume-mute-fill" id="volumeIcon"/>
                        </template>
                        <input
                            type="range"
                            min="0"
                            max="1024"
                            step="0.1"
                            :value="volume"
                            @change="ChangeAudioValue"
                            ref="volume"
                            style="vertical-align: middle;"/>

                        </div>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col v-bind:playing="IsPlaying()">
                        <b-button
                            ref="btn_PlayPause"
                            type="button"
                            @click="ToggleAudio">

                            {{ IsPlaying() ? 'Pause' : 'Play' }}

                        </b-button>
                        <b-button
                            ref="btn_NewSong"
                            @click="SelectNewRandomAudio()">
                            New Song
                        </b-button>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col>
                        <code style="background-color: black; color: white;">
                            {{ audioObject !== null && audioObject.name !== null ? audioObject.name : 'no track playing' }}
                        </code>
                    </b-col>
                </b-row>
            </div>
        </template>
        <ul class="links">
            <template v-for="link in PageLinks">
                <li v-bind:key="link.type">
                    <img :src="`https://res.kate.pet/image/links/${link.type}.png`"
                        @click="PageRedirect"
                        :location="link.location"
                        class="LinkTab"
                        name="discord" />
                </li>
            </template>
        </ul>
        <!-- <b-tabs pills align="center" content-class="mt-3" active-nav-item-class="font-weight-bold cool-selected-tab">
            <template v-for="link in PageLinks">
                <b-tab role="presentation" @click="PageRedirect" v-bind:key="link.type">
                    <template #title>
                        <span
                            :location="link.location"
                            class="LinkTab"
                            :style="{'--color': link.color, '--color-hover': link.colorhover}"
                            name="discord">

                            {{link.type}}
                        </span>
                    </template>
                </b-tab>
            </template>
        </b-tabs> -->
    </div>
</template>
<style scoped>
.tabs {
    width: fit-content;
    margin: auto;
    width: 50%;
    margin-top: 30px;
}
.backgroundElement {
    position: fixed;
    top: 0;
    left: 0;
    z-index: -100;
    margin: 0;
    padding: 0;
    width: 100vw;
    height: 100vh;
    background: #000 !important;
}
.backgroundElement[type=visualizer] canvas {
    margin: 0;
    padding: 0;
    opacity: 0.2;
    filter: blur(10px);
    transition: 300ms;
}
.LinkTab {
    color: var(--color);
    transition: 200ms;
}
.LinkTab:hover {
    color: var(--color-hover);
    transition: 200ms;
    cursor: pointer;
}
#volumeIcon {
    color: #eee;
    font-size: 3rem;
    vertical-align: middle;
}
img.LinkTab {
    border: 2px solid rgb(109, 109, 109);
    height: 71px;
    width: 200px;

    -webkit-transition: 0.4s;
    transition: 0.4s;
    -webkit-filter: brightness(75%) grayscale(100%) sepia(10%);
    filter: brightness(75%) grayscale(100%) sepia(10%);
}
img.LinkTab:hover {
    border: 2px outset rgba(255,90,120,.7);

    cursor: pointer;
    -webkit-transition: 0.2s;
    transition: 0.2s;
    -webkit-filter: brightness(100%) grayscale(0%) sepia(0%) hue-rotate(360deg) saturate(130%) contrast(1);
    filter: brightness(100%) grayscale(0%) sepia(0%) hue-rotate(360deg) saturate(130%) contrast(1);
}
ul.links {
    display:block;
    background-color: rgba(0,0,0,0.6);
    height: 71px;
    margin: 6px;
}
ul.links li {
    vertical-align: top;
    width: 200px;
    height: 71px;
    margin: 4px;
    padding: 2px;
}
ul.links,
ul.links li {
    display: inline;
    margin: none;
    padding: 0;
    list-style: none;
}
</style>
<style>
* {
    transition: 300ms;
}
.cool-selected-tab {
    background-color: rgba(255, 255, 255, 0.1) !important;
    border: 1px solid #fff;
}
</style>
<script>
import Visualizer from './Visualizer.vue';

const AudioSelect = require('./AudioSelect');
const $ = require('jquery');

export default {
    name: 'Home',
    components: {Visualizer},
    data () {
        if (localStorage.AudioVolume === undefined) {
            localStorage.AudioVolume = 0.3;
        }
        if (localStorage.AudioAutoplay === undefined) {
            localStorage.AudioAutoplay = 'false';
        }
        if (localStorage.Visualizer === undefined) {
            localStorage.Visualizer = 'true';
        }
        return {
            audioURL: null,
            audioObject: null,
            subtitle: '',
            volume: parseFloat(localStorage.AudioVolume) * 1024,
            playing: false,
            autoplay: localStorage.AudioAutoplay === 'true' ? true : false,
            visualizerComponent: true,
            visualizer: null,
            enableVisualizer: localStorage.Visualizer === 'true' ? true : false,
            PageLinks: [
                {
                    type: 'discord',
                    color: '#5865F2',
                    colorhover: '#e1e1e1',
                    location: 'https://discord.gg/GPjpzRvpSp'
                },
                {
                    type: 'github',
                    color: '#8867b8',
                    colorhover: '#e1e1e1',
                    location: 'https://github.com/ktwrd'
                },
                {
                    type: 'twitter',
                    color: '#1DA1F2',
                    colorhover: '#e1e1e1',
                    location: 'https://twitter.com/seedvevo'
                }/* ,
                {
                    type: 'kofi',
                    color: '#9d6538',
                    colorhover: '#e1e1e1',
                    location: 'https://ko-fi.com/seeeeeed'
                } */
            ]
        };
    },
    mounted () {
        $(this.$refs.btn_NewSong).prop('disabled', true);
        if (this.$data.autoplay) {
            this.ToggleAudio();
        }
    },
    methods: {
        PageRedirect (event) {
            console.log(event);
            window.location = event.target.attributes.location.value;
        },
        ChangeAudioValue () {
            this.volume = this.$refs.volume.value;
            localStorage.AudioVolume = this.$refs.volume.value / 1024;
            this.$refs.vis.setVolume(this.$refs.volume.value / 1024);
            this.$refs.volume.value = this.$refs.volume.value / 1024;
        },
        ToggleAudio () {
            if (this.$refs.vis.visualizer == null) {
                this.SelectRandomAudio();
            }
            this.$refs.vis.playpause();
            this.$data.playing = this.$refs.vis.playing;
        },
        async SelectNewRandomAudio () {
            this.$delete(this.$children, 0);
            this.$refs.vis.kill();
            await this.SelectRandomAudio();
            this.ToggleAudio();
        },
        IsPlaying () {
            if (this.$refs.vis === undefined) return false;
            return this.$refs.vis.$data.playing;
        },
        async SelectRandomAudio () {
            $(this.$refs.btn_NewSong).prop('disabled', true);
            $(this.$refs.btn_PlayPause).prop('disabled', true);
            if (this.$refs.vis.playing) {
                this.$refs.vis.playpause();
            }
            this.$data.audioObject = AudioSelect.select();
            this.$data.audioURL = this.$data.audioObject.url;
            await this.$refs.vis.loadAudioFromURL(this.$data.audioURL);
            this.ChangeAudioValue(this.$data.volume);
            this.$refs.vis.playpause();
            $(this.$refs.btn_NewSong).prop('disabled', false);
            $(this.$refs.btn_PlayPause).prop('disabled', false);
        }
    }
};
</script>
