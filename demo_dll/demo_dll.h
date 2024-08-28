// demo_dll.h : main header file for the demo_dll DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error "include 'stdafx.h' before including this file for PCH"
#endif

#include "resource.h"		// main symbols


// Cdemo_dllApp
// See demo_dll.cpp for the implementation of this class
//

class Cdemo_dllApp : public CWinApp
{
public:
	Cdemo_dllApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
