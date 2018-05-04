// mexMat.h : main header file for the mexMat DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error "include 'stdafx.h' before including this file for PCH"
#endif

#include "resource.h"		// main symbols


// CmexMatApp
// See mexMat.cpp for the implementation of this class
//

class CmexMatApp : public CWinApp
{
public:
	CmexMatApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
