// OpacityMask.qml
import QtQuick 2.15
import QtQuick.Shapes 1.15

ShaderEffect {
    id: root
    property variant source
    property variant mask

    fragmentShader: "
        uniform sampler2D source;
        uniform sampler2D mask;
        varying vec2 qt_TexCoord0;
        void main() {
            vec4 sourceColor = texture2D(source, qt_TexCoord0);
            vec4 maskColor = texture2D(mask, qt_TexCoord0);
            gl_FragColor = vec4(sourceColor.rgb, maskColor.a * sourceColor.a);
        }
    "

    ShaderEffectSource {
        id: sourceItem
        sourceItem: root.source
        hideSource: true
    }

    ShaderEffectSource {
        id: maskItem
        sourceItem: root.mask
        hideSource: true
    }
}
