<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14113" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="BYZ-38-t0r">
    <device id="retina5_9" orientation="portrait">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14088"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--View Controller-->
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController id="BYZ-38-t0r" customClass="ViewController" customModule="Concentration" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="812"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="KaU-CM-bUE">
                                <rect key="frame" x="81" y="134" width="82" height="119"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <color key="backgroundColor" red="1" green="0.57637232540000005" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <fontDescription key="fontDescription" type="system" pointSize="50"/>
                                <connections>
                                    <action selector="touchCard:" destination="BYZ-38-t0r" eventType="touchUpInside" id="xtq-hZ-krW"/>
                                </connections>
                            </button>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="8s7-yO-Flk">
                                <rect key="frame" x="196" y="147" width="82" height="119"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <color key="backgroundColor" red="1" green="0.57637232540000005" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <fontDescription key="fontDescription" type="system" pointSize="50"/>
                                <connections>
                                    <action selector="touchCard:" destination="BYZ-38-t0r" eventType="touchUpInside" id="q9I-OQ-YD0"/>
                                </connections>
                            </button>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Flips : 0" textAlignment="center" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="Nue-Vx-keW">
                                <rect key="frame" x="72" y="596" width="230" height="48"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="40"/>
                                <color key="textColor" red="1" green="0.57637232540000005" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="sJh-KB-TKe">
                                <rect key="frame" x="81" y="309" width="82" height="119"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <color key="backgroundColor" red="1" green="0.57637232540000005" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <fontDescription key="fontDescription" type="system" pointSize="50"/>
                                <connections>
                                    <action selector="touchCard:" destination="BYZ-38-t0r" eventType="touchUpInside" id="AbY-NM-9ii"/>
                                </connections>
                            </button>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="ayo-Kb-vdR">
                                <rect key="frame" x="196" y="322" width="82" height="119"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <color key="backgroundColor" red="1" green="0.57637232540000005" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <fontDescription key="fontDescription" type="system" pointSize="50"/>
                                <connections>
                                    <action selector="touchCard:" destination="BYZ-38-t0r" eventType="touchUpInside" id="Ztt-yD-5Oe"/>
                                </connections>
                            </button>
                        </subviews>
                        <color key="backgroundColor" red="0.0" green="0.0" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                        <viewLayoutGuide key="safeArea" id="6Tk-OE-BBY"/>
                    </view>
                    <connections>
                        <outlet property="flipCountLabel" destination="Nue-Vx-keW" id="EoU-XX-oGb"/>
                        <outletCollection property="cardButtons" destination="KaU-CM-bUE" collectionClass="NSMutableArray" id="D9f-w4-jg9"/>
                        <outletCollection property="cardButtons" destination="8s7-yO-Flk" collectionClass="NSMutableArray" id="OK2-l2-mUI"/>
                        <outletCollection property="cardButtons" destination="ayo-Kb-vdR" collectionClass="NSMutableArray" id="oix-Bk-MRT"/>
                        <outletCollection property="cardButtons" destination="sJh-KB-TKe" collectionClass="NSMutableArray" id="1sC-ab-Bsf"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="136.80000000000001" y="128.57142857142858"/>
        </scene>
    </scenes>
</document>
