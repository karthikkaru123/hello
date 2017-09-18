"use strict";

var global = {
    scene: null,
    camera: null,
    renderer: null,
    world: null,
    loadManager: null,
    jsonLoader: null,
    light: null,
    debugger: null,
    debug: false,
    count: 0,
    max: 0
};

var physix = {
    body: null,
    updates: []
};

var mesh = {
    container: null,
    jsonData: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/304639/plus-skin.json',
    geometry: null,
    plus: null
};

var init = function init() {
    initScene();
    initLight();
    initWorld();
    clonePlus();
    initLoader();
    loadModel();
};

var initScene = function initScene() {
    global.scene = new THREE.Scene();

    global.camera = new THREE.PerspectiveCamera(40, window.innerWidth / window.innerHeight, 0.0001, 10000);
    global.camera.position.set(-7, -3, 20);
    global.camera.lookAt(global.scene.position);
    global.scene.add(global.camera);

    global.renderer = new THREE.WebGLRenderer({
        alpha: true,
        antialias: true,
        logarithmicDepthBuffer: true
    });
    global.renderer.setSize(window.innerWidth, window.innerHeight);

    document.querySelector("[data-stage]").appendChild(global.renderer.domElement);
};

var initLight = function initLight() {
    global.light = new THREE.PointLight(0xd5d5d5, 0.6, 30);
    global.light.position.set(-10, 10, 10);
    global.scene.add(global.light);

    var hemi = new THREE.HemisphereLight(0xffffff, 0xd5d5d5, 0.1);
    global.scene.add(hemi);
};

var initLoader = function initLoader() {
    global.loadManager = new THREE.LoadingManager();
    global.jsonLoader = new THREE.JSONLoader(global.loadManager);
    global.loadManager.onLoad = function () {
        createPlus(animate);
    };
};

var loadModel = function loadModel() {
    global.jsonLoader.load(mesh.jsonData, function (geometry) {
        mesh.geometry = geometry;
    });
};

var initWorld = function initWorld() {
    global.world = new CANNON.World();
    global.world.broadphase = new CANNON.NaiveBroadphase();
    global.world.gravity.set(-8, 0, 0);
    global.world.solver.iterations = 10;

    global.debugger = new THREE.CannonDebugRenderer(global.scene, global.world);
};

var getRandomArbitrary = function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
};

var getRandomInt = function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

var createBall = function createBall() {
    var mass = 0.8;
    var radius = 0.3;
    var lat = Math.tan(global.camera.fov * 1 / 360 * 2 * Math.PI) * global.camera.position.z;
    var x = lat * global.camera.aspect;
    var y = Math.random() * 0.001;
    var z = Math.random() * 0.001;

    var shape = new CANNON.Sphere(radius * 1.1);
    var body = new CANNON.Body({ mass: mass, shape: shape });
    body.position.set(x, y, z);
    global.world.add(body);

    var colors = [0x47debd, 0x2e044e, 0x7821ec, 0xfff95d];
    var color = colors[getRandomInt(0, 3)];

    var material = new THREE.MeshLambertMaterial({
        emissive: color,
        emissiveIntensity: 0.8,
        color: 0x7821ec
    });

    var ball = new THREE.Mesh(new THREE.SphereGeometry(radius, 16, 16), material);
    ball.position.set(x, y, z);
    global.scene.add(ball);

    var array = [body, ball];
    physix.updates.push(array);
};

var updatePhysix = function updatePhysix() {
    for (var i = 0; i < physix.updates.length; i++) {
        physix.updates[i][1].position.copy(physix.updates[i][0].position);
        physix.updates[i][1].quaternion.copy(physix.updates[i][0].quaternion);
    }
};

var clonePlus = function clonePlus() {
    var offset = 3;
    var radius = 1;

    physix.body = new CANNON.Body({ mass: 0 });
    var sphere = new CANNON.Sphere(radius);

    var pos = [[-offset, 0, 0], [offset, 0, 0], [0, -offset, 0], [0, offset, 0], [0, 0, -offset], [0, 0, offset]];

    for (var i = 0; i < pos.length; i++) {
        physix.body.addShape(sphere, new CANNON.Vec3(pos[i][0], pos[i][1], pos[i][2]));
    }

    var rot = [[1, 0, 0], [0, 1, 0], [0, 0, 1]];

    for (var i = 0; i < rot.length; i++) {
        var cylinder = new CANNON.Cylinder(radius, radius, radius * 6, 16);
        var q = new CANNON.Quaternion();
        q.setFromAxisAngle(new CANNON.Vec3(rot[i][0], rot[i][1], rot[i][2]), Math.PI * 0.5);
        cylinder.transformAllPoints(new CANNON.Vec3(), q);
        physix.body.addShape(cylinder);
    }

    physix.body.position.set(0, 0, 0);
    global.world.add(physix.body);
};

var createPlus = function createPlus(callback) {
    mesh.container = new THREE.Group();
    global.scene.add(mesh.container);

    var material = new THREE.MeshPhongMaterial({
        emissive: 0xc0c0c0,
        emissiveIntensity: 0.8,
        specular: 0xfefefe,
        shininess: 0,
        color: 0xebebeb
    });

    mesh.plus = new THREE.Mesh(mesh.geometry, material);
    mesh.container.add(mesh.plus);

    var array = [mesh.plus, physix.body];
    physix.updates.push(array);

    callback();
};

var animate = function animate() {
    var time = 4;
    var timeStep = 1.0 / 60.0;

    var tl = new TimelineMax({
        repeat: -1,
        onUpdate: function onUpdate() {
            global.world.step(timeStep);
            render();
        }
    });

    tl.to(mesh.plus.rotation, time, {
        y: Math.PI * 2,
        x: Math.PI * 2,
        ease: Power0.easeNone
    });
};

window.addEventListener("resize", resizeHandler);
window.addEventListener("mousedown", createBall);

var render = function render() {
    updatePhysix();

    global.count++;
    if (global.count >= 20 && global.max <= 3000) {
        global.max++;
        global.count = 0;
        createBall();
    }

    if (global.max === 3000) {
        global.max++;
    }

    if (global.debug) global.debugger.update();

    global.renderer.render(global.scene, global.camera);
};

function resizeHandler() {
    global.renderer.setSize(window.innerWidth, window.innerHeight);
    global.camera.aspect = window.innerWidth / window.innerHeight;
    global.camera.updateProjectionMatrix();
}

init();